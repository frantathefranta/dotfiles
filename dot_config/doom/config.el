;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Franta Bartik"
      user-mail-address "fb@franta.us")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/syncthing/org/")

;; Auto revert (refresh actually, I don't understand the language here) files when they change
;; Copied from here https://kundeveloper.com/blog/autorevert/
(global-auto-revert-mode t)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;; (use-package uuid :commands uuid-string)
;; (defun uuid-string ()
;;   "Make a string form of a UUID directly."
;;   (uuid))
;; NOTE All meain functions are from here https://github.com/meain/dotfiles/blob/25863934a8bcab3e1075cf2f7564b1290b77d14b/emacs/.config/emacs/init.el#L2186
(defun meain/get-scratch-message ()
  "Pull a random fortue entry and format it for `lisp-interaction' mode as a comment."
  (concat (mapconcat 'identity
                     (mapcar (lambda (x)
                               (cl-concatenate 'string ";; " x))
                             (cl-remove-if (lambda (x)
                                             (equal x ""))
                                           (split-string (shell-command-to-string "shuf -n1 ~/.local/share/quotes")
                                                         "\n")))
                     "\n")
          "\n"))
(setq initial-scratch-message (meain/get-scratch-message))
(defun meain/create-or-switch-to-scratch ()
  "Switch to scratch buffer if exists, else create a scratch buffer with our config."
  (cond
   ((get-buffer "*scratch*")
    (switch-to-buffer "*scratch*"))
   (t (progn
        (switch-to-buffer "*scratch*")
        (setq default-directory "~/")
        (lisp-interaction-mode)
        (insert (meain/get-scratch-message))))))
(defun meain/kill-current-buffer-unless-scratch ()
  "Kill current buffer if it is not scratch."
  (interactive)
  (if (= (length (mapcar #'window-buffer
                         (window-list))) 1)
      (meain/create-or-switch-to-scratch)
    (cond
     ((derived-mode-p 'prog-mode)
      (evil-quit))
     ((member major-mode '(imenu-list-major-mode magit-mode))
      (evil-quit))
     ((equal major-mode 'vterm-mode)
      (progn
        (evil-insert 1)
        (vterm-reset-cursor-point)))
     (t (previous-buffer)))))
(define-key evil-normal-state-map (kbd "q") 'meain/kill-current-buffer-unless-scratch)

(defun meain/quick-edit-end ()
  "Util function to be executed on qed completion."
  (interactive)
  (mark-whole-buffer)
  (call-interactively 'kill-ring-save)
  (meain/kill-current-buffer-unless-scratch))
(defun meain/quick-edit ()
  "Util function for use with hammerspoon quick edit functionality."
  (interactive)
  (let ((qed-buffer-name (cl-concatenate 'string
                                 "qed-"
                                 (substring (uuidgen-4)
                                        0
                                        4))))
    (generate-new-buffer qed-buffer-name)
    (switch-to-buffer qed-buffer-name)
    (evil-paste-after 1)
    (gfm-mode)))
