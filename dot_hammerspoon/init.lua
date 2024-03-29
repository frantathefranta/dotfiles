require("hs.ipc")
local hyper = {"cmd", "alt", "ctrl", "shift"}
local editor = "Emacs"

-- Optional configuration of beginEditShellCommand
-- spoon.editWithEmacs.openEditorShellCommand = "editor -e '(hammerspoon-edit-begin)'"

hs.loadSpoon("editWithEmacs")
if spoon.editWithEmacs then
   local bindings = {
      edit_selection =  { {"alt"}, "1"},
      edit_all       = { {"alt"}, "2"}
   }   
   spoon.editWithEmacs:bindHotkeys(bindings)
end

-- local quick_edit_app = nil
-- -- This block copies a text field in browser and opens it in Emacs
-- -- More information here https://github.com/meain/dotfiles/blob/25863934a8bcab3e1075cf2f7564b1290b77d14b/hammerspoon/.config/hammerspoon/init.lua#L363
-- hs.hotkey.bind(
--     hyper,
--     "`",
--     function()
--         local emacs = hs.application.find(editor)
--         local current_app = hs.window.focusedWindow()
--         if current_app:title():sub(1, 5) == editor then
--             if quick_edit_app == nil then
--                 hs.alert("🤔 No edit in progress")
--                 return
--             end
--             hs.eventtap.keyStroke({"alt", "shift"}, ";")
--             hs.eventtap.keyStrokes("(meain/quick-edit-end)")
--             hs.eventtap.keyStroke({}, "return")
--             quick_edit_app:focus()
--             os.execute("sleep " .. tonumber(1))
--             hs.eventtap.keyStroke({"cmd"}, "a")
--             hs.eventtap.keyStroke({"cmd"}, "v")
--             quick_edit_app = nil
--         else
--             quick_edit_app = hs.window.focusedWindow()
--             hs.eventtap.keyStroke({"cmd"}, "a")
--             hs.eventtap.keyStroke({"cmd"}, "c")
--             emacs:activate()
--             hs.eventtap.keyStroke({"alt", "shift"}, ";")
--             hs.eventtap.keyStrokes("(meain/quick-edit)")
--             hs.eventtap.keyStroke({}, "return")
--         end
--     end
-- )
hs.hotkey.bind(hyper, "k", function()
	hs.application.launchOrFocus("/Applications/iTerm.app")
end)

hs.hotkey.bind(hyper, "e", function()
	hs.application.launchOrFocus("Emacs")
end)

-- hs.hotkey.bind(hyper, "o", function()
-- 	hs.application.launchOrFocus("Orion")
-- end)

hs.hotkey.bind(hyper, "s", function()
	hs.application.launchOrFocus("Slack")
end)

hs.hotkey.bind(hyper, "a", function()
	hs.application.launchOrFocus("Asana")
end)

hs.hotkey.bind(hyper, "m", function()
	hs.application.launchOrFocus("/Applications/Microsoft Outlook.app")
end)

-- hs.hotkey.bind(hyper, "v", function()
-- 	hs.application.launchOrFocus("/Applications/VNC Viewer.app")
-- end)

hs.hotkey.bind(hyper, "t", function()
	hs.application.launchOrFocus("/Applications/Microsoft To Do.app")
end)

-- hs.hotkey.bind(hyper, "n", function()
-- 	hs.application.launchOrFocus("/Applications/Neovide.app")
-- end)

hs.hotkey.bind(hyper, "l", function()
	hs.application.launchOrFocus("/Applications/LibreWolf.app")
end)
hs.hotkey.bind(hyper, "w", function()
	hs.application.launchOrFocus("/Applications/Firefox.app")
end)
hs.hotkey.bind(hyper, "h", function()
	hs.application.launchOrFocus("/Applications/Alacritty.app")
end)
-- hs.hotkey.bind(hyper, "a", function()
-- 	hs.application.launchOrFocus("Alacritty")
-- end)

-- local wf=hs.window.filter
-- switcher = hs.window.switcher.new()
-- switcher_firefox = hs.window.switcher.new(wf.new():setAppFilter('/Applications/Firefox.app'))
-- switcher_space = hs.window.switcher.new(wf.new():setCurrentSpace(true):setDefaultFilter{}) -- include minimized/hidden windows, current Space only
-- hs.hotkey.bind('alt','tab','Next window',function()switcher:next()end)
-- hs.hotkey.bind(hyper,'tab','Next window',function()switcher_firefox:next()end)
-- hs.hotkey.bind('alt-shift','tab','Prev window',function()switcher_space:previous()end)


hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()
