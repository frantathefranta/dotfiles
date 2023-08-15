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
;; (when (doom-font-exists-p "Iosevka Custom")
(setq doom-font                (font-spec :name "IosevkaCustom Nerd Font Mono" :width 'expanded :size 17))
(when (doom-font-exists-p "EtBembo")
    (setq doom-variable-pitch-font (font-spec :name "EtBembo")))
;; Hasklug doesn't work for Emacs for some reason, it makes the highlighted lines jump back on forth
;; (setq doom-font (font-spec :family "Hasklug Nerd Font" :size 16))
     ;; doom-variable-pitch-font (font-spec :family "Hasklug Nerd Font" :size 16))

;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-feather-light)
;; (custom-theme-set-faces!
;; 'doom-feather-light
;; '(org-level-4 :inherit outline-4 :height 1.1)
;; '(org-level-3 :inherit outline-3 :height 1.2)
;; '(org-level-2 :inherit outline-2 :height 1.3)
;; '(org-level-1 :inherit outline-1 :height 1.4)
;; '(org-document-title :height 1.5 :underline nil))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-grow-only   t
      display-line-numbers-type        'relative
      display-line-numbers-width-start t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/syncthing/org/")
(setq org-capture-templates '(
                        ("t" "Todo [inbox]" entry
                        (file+headline "~/syncthing/org/inbox.org" "Tasks")
                        "* TODO %i%?")

                        ("s" "Slipbox" entry  (file "~/syncthing/org/org-roam/inbox.org")
                        "* %?\n")
                        )
      )
(setq org-agenda-files '("~/syncthing/org/inbox.org"
                         "~/syncthing/org/gtd.org"
                         "~/syncthing/org/tickler.org"))

(setq org-roam-directory (file-truename "~/syncthing/org/org-roam"))
(org-roam-db-autosync-mode) ;; Syncs the org-roam database on startup, will fail if emacs-sql doesn't exists yet. To fix, run the command manually
(setq org-roam-capture-templates
      '(("d" "Plain Note" plain "%?"
         :if-new
         (file+head "${slug}.org" "#+title: ${title}\n")
         :immediate-finish t
         :unnarrowed t)
        ("s" "Command" plain
         "* %?:\n#+BEGIN_SRC sh\n\n#+END_SRC"
         :if-new (file+head "docs/${slug}.org"
                            "#+title: ${title}\n#+filetags: docs")
         :immediate-finish t
         :unnarrowed t)
        ("w" "Work notes" plain "%?"
         :if-new
         (file+head "worknotes/${title}.org" "#+title: ${title}\n#+filetags: work")
         :immediate-finish t
         :unnarrowed t)
        )
      )

(cl-defmethod org-roam-node-type ((node org-roam-node))
  "Return the TYPE of NODE."
  (condition-case nil
      (file-name-nondirectory
       (directory-file-name
        (file-name-directory
         (file-relative-name (org-roam-node-file node) org-roam-directory))))
    (error "")))
(setq org-roam-node-display-template
      (concat "${type:15} ${title:*} "
              (propertize "${tags:10}" 'face 'org-tag)
              )
      )

;; (add-hook! 'org-mode-hook #'mixed-pitch-mode)

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
;; (customize-set-variable
;;  'tramp-password-prompt-regexp
;;  (concat
;;   "^.*"
;;   (regexp-opt
;;    '("passphrase"))))
;; (add-to-list 'tramp-connection-properties
;;              (list (regexp-quote "/ssh:fbartik@bastion2.osc.edu:")
;;                    "remote-shell" "/bin/bash"))
(use-package! plz)
(if (eq system-type 'darwin)
  (load "~/.hammerspoon/Spoons/editWithEmacs.spoon/hammerspoon.el")
)
;; (customize-set-variable 'tramp-encoding-shell "/bin/zsh")
;; (customize-set-variable
;;  'tramp-ssh-controlmaster-options
;;  (concat
;;  "-o ControlPath=/Users/fbartik/.ssh/cm-%%r@%%h:%%p "
;;  "-o ControlMaster=auto -o ControlPersist=yes"))
(customize-set-variable 'tramp-use-ssh-controlmaster-options nil)
(setq tramp-verbose 6)
(setq tramp-terminal-type "tramp")
;; (setq tramp-shell-prompt-pattern "\\(?:^\\|\r\\)[^]#$%>\n]*#?[]#$%>].* *\\(^[\\[[0-9;]*[a-zA-Z] *\\)*")
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
