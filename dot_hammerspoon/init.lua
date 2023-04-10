local hyper = {"cmd", "alt", "ctrl", "shift"}

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
