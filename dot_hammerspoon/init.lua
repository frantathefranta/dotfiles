local hyper = {"cmd", "alt", "ctrl", "shift"}
local editor = "Emacs"

local quick_edit_app = nil
hs.hotkey.bind(
    hyper,
    "`",
    function()
        local emacs = hs.application.find(editor)
        local current_app = hs.window.focusedWindow()
        if current_app:title():sub(1, 5) == editor then
            if quick_edit_app == nil then
                hs.alert("🤔 No edit in progress")
                return
            end
            hs.eventtap.keyStroke({"alt", "shift"}, ";")
            hs.eventtap.keyStrokes("(meain/quick-edit-end)")
            hs.eventtap.keyStroke({}, "return")
            quick_edit_app:focus()
            os.execute("sleep " .. tonumber(1))
            hs.eventtap.keyStroke({"cmd"}, "a")
            hs.eventtap.keyStroke({"cmd"}, "v")
            quick_edit_app = nil
        else
            quick_edit_app = hs.window.focusedWindow()
            hs.eventtap.keyStroke({"cmd"}, "a")
            hs.eventtap.keyStroke({"cmd"}, "c")
            emacs:activate()
            hs.eventtap.keyStroke({"alt", "shift"}, ";")
            hs.eventtap.keyStrokes("(meain/quick-edit)")
            hs.eventtap.keyStroke({}, "return")
        end
    end
)
hs.hotkey.bind(hyper, "k", function()
	hs.application.launchOrFocus("Kitty")
end)

hs.hotkey.bind(hyper, "e", function()
	hs.application.launchOrFocus("Emacs")
end)

hs.hotkey.bind(hyper, "o", function()
	hs.application.launchOrFocus("Orion")
end)

hs.hotkey.bind(hyper, "s", function()
	hs.application.launchOrFocus("Slack")
end)

hs.hotkey.bind(hyper, "a", function()
	hs.application.launchOrFocus("Asana")
end)

hs.hotkey.bind(hyper, "m", function()
	hs.application.launchOrFocus("/Applications/Microsoft Outlook.app")
end)

hs.hotkey.bind(hyper, "v", function()
	hs.application.launchOrFocus("/Applications/VNC Viewer.app")
end)

hs.loadSpoon("ReloadConfiguration")
spoon.ReloadConfiguration:start()