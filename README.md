# FOCUS Lib
## clean stable UI Library. works for studio too!



# DOCUMENTATION

## starting up the lib
```lua
local FocusLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/d4ba/FocusLib/main/source.lua"))();
```
## create window
```lua
local window = FocusLib:Window{
  Name = "FocusLib" -- default name
}
```

## creating a tab
```lua
local Tab = window:CreateTab({
  Name = "Tab",
  Icon = "rbxassetid://3926305904" -- you can get images from raw github png links
})
```

## creating a button
```lua
local Button = Tab:CreateButton({
  Name = "Button",
  Callback = function()
      print("i have been pressed1")
  end
})
```

### updating a button
```lua
Button:SetText("Button2")
```

## creating a warning
```lua
local Warning = Tab:CreateWarning({
  Name = "I am a warning."
})

--[[
  To update the warning
  Warning:SetText("i am a warning but i was changed")
]]
```

## creating a info message
```lua
local InfoMsg = Tab:CreateInfo({
  Name = "This is information and its blue"
})
-- to update this its the same as the button and warning
```
## creating a label
```lua
local Label = Tab:CreateLabel({
  Name = "i am a label"
})
```

## creating a slider
```lua
local slider = Tab:CreateSlider({
  Name = "Slider",
  Min = 10,
  Max = 100,
  Default = 50,
  Callback = function(v)
      print(v)
  end
})
```

## creating a toggle
```
local toggle = Tab:CreateToggle({
  Name = "Toggle",
  Callback = function(bool)
      print(bool)
  end
})
```


