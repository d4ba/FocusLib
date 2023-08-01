--services
local Players = game:GetService("Players")
local TweenService =game:GetService("TweenService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local uis = game:GetService("UserInputService")
local tweenInfo = TweenInfo.new(0.2,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut)

--vars
local viewport = workspace.CurrentCamera.ViewportSize
local Library = {}
local lp = game:GetService("Players").LocalPlayer
local mouse = lp:GetMouse()

function Library:tween(object, goal, callback)
	local tween = TweenService:Create(object, tweenInfo, goal)
	tween.Completed:Connect(callback or function() end)
	tween:Play()
end

function Library:validate(defaults,options)
	for i,v in pairs(defaults) do
		if options[i] == nil then
			options[i] = v
		end
	end
end



function Library:Window(options)
	local options = options or {}
	Library:validate({
		Name = "FocusLib"
	},options)
	local GUI = {
		CurrentTab = nil
	}

	-- main gui
	do
		-- StarterGui.SimplifiedUI
		GUI["1"] = Instance.new("ScreenGui", RunService:IsStudio() and Players.LocalPlayer.PlayerGui or CoreGui);
		GUI["1"]["Name"] = [[SimplifiedUI]];
		GUI["1"]["IgnoreGuiInset"] = true

		-- StarterGui.SimplifiedUI.Main
		GUI["2"] = Instance.new("Frame", GUI["1"]);
		GUI["2"]["BorderSizePixel"] = 0;
		GUI["2"]["BackgroundColor3"] = Color3.fromRGB(66, 66, 66);
		GUI["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["2"]["Size"] = UDim2.new(0, 400, 0, 300);
		GUI["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["2"]["Position"] = UDim2.new(0.5,0,0.5,0);
		GUI["2"]["Name"] = [[Main]];
		GUI["2"]["Draggable"] = true;
		

		-- StarterGui.SimplifiedUI.Main.UICorner
		GUI["3"] = Instance.new("UICorner", GUI["2"]);

		-- StarterGui.SimplifiedUI.Main.DropShadowHolder
		GUI["64"] = Instance.new("Frame", GUI["2"]);
		GUI["64"]["ZIndex"] = 0;
		GUI["64"]["BorderSizePixel"] = 0;
		GUI["64"]["BackgroundTransparency"] = 1;
		GUI["64"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["64"]["Name"] = [[DropShadowHolder]];

		-- StarterGui.SimplifiedUI.Main.DropShadowHolder.DropShadow
		GUI["65"] = Instance.new("ImageLabel", GUI["64"]);
		GUI["65"]["ZIndex"] = 0;
		GUI["65"]["BorderSizePixel"] = 0;
		GUI["65"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
		GUI["65"]["ScaleType"] = Enum.ScaleType.Slice;
		GUI["65"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["65"]["ImageTransparency"] = 0.5;
		GUI["65"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
		GUI["65"]["Image"] = [[rbxassetid://6014261993]];
		GUI["65"]["Size"] = UDim2.new(1, 47, 1, 47);
		GUI["65"]["Name"] = [[DropShadow]];
		GUI["65"]["BackgroundTransparency"] = 1;
		GUI["65"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

		-- StarterGui.SimplifiedUI.Main.TopBar
		GUI["4"] = Instance.new("Frame", GUI["2"]);
		GUI["4"]["BorderSizePixel"] = 0;
		GUI["4"]["BackgroundColor3"] = Color3.fromRGB(55, 55, 55);
		GUI["4"]["Size"] = UDim2.new(1, 0, 0.10000000149011612, 0);
		GUI["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["4"]["Name"] = [[TopBar]];

		-- StarterGui.SimplifiedUI.Main.TopBar.UICorner
		GUI["5"] = Instance.new("UICorner", GUI["4"]);


		-- StarterGui.SimplifiedUI.Main.TopBar.Extension
		GUI["6"] = Instance.new("Frame", GUI["4"]);
		GUI["6"]["BorderSizePixel"] = 0;
		GUI["6"]["BackgroundColor3"] = Color3.fromRGB(55, 55, 55);
		GUI["6"]["Size"] = UDim2.new(1, 0, 0.5, 0);
		GUI["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["6"]["Position"] = UDim2.new(0, 0, 0.5, 0);
		GUI["6"]["Name"] = [[Extension]];

		-- StarterGui.SimplifiedUI.Main.TopBar.Title
		GUI["7"] = Instance.new("TextLabel", GUI["4"]);
		GUI["7"]["BorderSizePixel"] = 0;
		GUI["7"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["7"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		GUI["7"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		GUI["7"]["TextSize"] = 15;
		GUI["7"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["7"]["Size"] = UDim2.new(0.25249993801116943, 0, 0.699999988079071, 0);
		GUI["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["7"]["Text"] = options["Name"];
		GUI["7"]["Name"] = [[Title]];
		GUI["7"]["BackgroundTransparency"] = 1;
		GUI["7"]["Position"] = UDim2.new(0.03999999910593033, 0, 0.13333334028720856, 0);

		-- StarterGui.SimplifiedUI.Main.TopBar.ExitBtn
		GUI["8"] = Instance.new("ImageButton", GUI["4"]);
		GUI["8"]["ZIndex"] = 2;
		GUI["8"]["Image"] = [[rbxassetid://3926305904]];
		GUI["8"]["ImageRectSize"] = Vector2.new(24, 24);
		GUI["8"]["Size"] = UDim2.new(0.0625000074505806, 0, 0.8333333134651184, 0);
		GUI["8"]["Name"] = [[ExitBtn]];
		GUI["8"]["ImageRectOffset"] = Vector2.new(284, 4);
		GUI["8"]["Position"] = UDim2.new(0.9225000143051147, 0, 0.06666667014360428, 0);
		GUI["8"]["BackgroundTransparency"] = 1;
		GUI["8"]["MouseButton1Click"]:Connect(function()
			GUI["1"]:Destroy()
		end)

		-- StarterGui.SimplifiedUI.Main.TopBar.Line
		GUI["9"] = Instance.new("Frame", GUI["4"]);
		GUI["9"]["BorderSizePixel"] = 0;
		GUI["9"]["BackgroundColor3"] = Color3.fromRGB(94, 94, 94);
		GUI["9"]["Size"] = UDim2.new(1, 0, 0, 1);
		GUI["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["9"]["Position"] = UDim2.new(0, 0, 0.9666666388511658, 0);
		GUI["9"]["Name"] = [[Line]];

		-- StarterGui.SimplifiedUI.Main.ContentContainer
		GUI["18"] = Instance.new("Frame", GUI["2"]);
		GUI["18"]["BorderSizePixel"] = 0;
		GUI["18"]["BackgroundColor3"] = Color3.fromRGB(54, 54, 54);
		GUI["18"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["18"]["Size"] = UDim2.new(1.027500033378601, -132, 1.0366666316986084, -42);
		GUI["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["18"]["Position"] = UDim2.new(1.002500057220459, -1, -0.013333333656191826, 35);
		GUI["18"]["Name"] = [[ContentContainer]];

		-- StarterGui.SimplifiedUI.Main.ContentContainer.UICorner
		GUI["19"] = Instance.new("UICorner", GUI["18"]);
		local frame = GUI["4"]

		local dragToggle = nil
		local dragSpeed = 0.1
		local dragStart = nil
		local startPos = nil

		local function updateInput(input)
			local delta = input.Position - dragStart
			local position = UDim2.new(startPos.X.Scale,startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
			game:GetService("TweenService"):Create(GUI["2"], TweenInfo.new(dragSpeed), {Position = position}):Play()
		end

		frame.InputBegan:Connect(function(input)
			if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
				dragToggle = true
				dragStart = input.Position
				startPos = GUI["2"].Position
				input.Changed:Connect(function()
					if input.UserInputState == Enum.UserInputState.End then
						dragToggle = false
					end
				end)
			end
		end)

		uis.InputChanged:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
				if dragToggle then
					updateInput(input)
				end
			end
		end)
	end
	-- navigation
	do
		-- StarterGui.SimplifiedUI.Main.Nagivation
		GUI["a"] = Instance.new("Frame", GUI["2"]);
		GUI["a"]["BorderSizePixel"] = 0;
		GUI["a"]["BackgroundColor3"] = Color3.fromRGB(73, 73, 73);
		GUI["a"]["Size"] = UDim2.new(0, 120, 1, -30);
		GUI["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["a"]["Position"] = UDim2.new(0, 0, 0, 30);
		GUI["a"]["Name"] = [[Nagivation]];

		-- StarterGui.SimplifiedUI.Main.Nagivation.UICorner
		GUI["b"] = Instance.new("UICorner", GUI["a"]);


		-- StarterGui.SimplifiedUI.Main.Nagivation.Hide
		GUI["c"] = Instance.new("Frame", GUI["a"]);
		GUI["c"]["BorderSizePixel"] = 0;
		GUI["c"]["BackgroundColor3"] = Color3.fromRGB(72, 72, 72);
		GUI["c"]["Size"] = UDim2.new(1, 0, 0, 20);
		GUI["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["c"]["Name"] = [[Hide]];

		-- StarterGui.SimplifiedUI.Main.Nagivation.Hide2
		GUI["d"] = Instance.new("Frame", GUI["a"]);
		GUI["d"]["BorderSizePixel"] = 0;
		GUI["d"]["BackgroundColor3"] = Color3.fromRGB(72, 72, 72);
		GUI["d"]["AnchorPoint"] = Vector2.new(1, 0);
		GUI["d"]["Size"] = UDim2.new(0, 20, 1, 0);
		GUI["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["d"]["Position"] = UDim2.new(1, 0, 0, 0);
		GUI["d"]["Name"] = [[Hide2]];

		-- StarterGui.SimplifiedUI.Main.Nagivation.ButtonHolder
		GUI["e"] = Instance.new("Frame", GUI["a"]);
		GUI["e"]["BorderSizePixel"] = 0;
		GUI["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		GUI["e"]["BackgroundTransparency"] = 1;
		GUI["e"]["Size"] = UDim2.new(1, 0, 1, 0);
		GUI["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["e"]["Name"] = [[ButtonHolder]];

		-- StarterGui.SimplifiedUI.Main.Nagivation.ButtonHolder.UIPadding
		GUI["f"] = Instance.new("UIPadding", GUI["e"]);
		GUI["f"]["PaddingTop"] = UDim.new(0, 1);
		GUI["f"]["PaddingBottom"] = UDim.new(0, 1);



		-- StarterGui.SimplifiedUI.Main.Nagivation.ButtonHolder.UIListLayout
		GUI["16"] = Instance.new("UIListLayout", GUI["e"]);
		GUI["16"]["Padding"] = UDim.new(0, 3);
		GUI["16"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

		-- StarterGui.SimplifiedUI.Main.Nagivation.line
		GUI["17"] = Instance.new("Frame", GUI["a"]);
		GUI["17"]["BorderSizePixel"] = 0;
		GUI["17"]["BackgroundColor3"] = Color3.fromRGB(94, 94, 94);
		GUI["17"]["Size"] = UDim2.new(0, 1, 1, 0);
		GUI["17"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		GUI["17"]["Position"] = UDim2.new(1, 0, 0, 0);
		GUI["17"]["Name"] = [[line]];
	end

	function GUI:CreateTab(options)
		local options = options or {}
		Library:validate({
			Name = "Tab",
			Icon = "rbxassetid://3926305904"
		},options)
		local Tab = {
			Hover = false,
			Active = false
		}


		-- StarterGui.SimplifiedUI.Main.Nagivation.ButtonHolder.Inactive
		Tab["13"] = Instance.new("TextLabel", GUI["e"]);
		Tab["13"]["BorderSizePixel"] = 0;
		Tab["13"]["BackgroundColor3"] = Color3.fromRGB(159, 159, 159);
		Tab["13"]["TextXAlignment"] = Enum.TextXAlignment.Left;
		Tab["13"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		Tab["13"]["TextSize"] = 12;
		Tab["13"]["TextColor3"] = Color3.fromRGB(194, 194, 194);
		Tab["13"]["Size"] = UDim2.new(1, 0, 0, 25);
		Tab["13"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Tab["13"]["Text"] = options.Name;
		Tab["13"]["Name"] = options.Name;
		Tab["13"]["BackgroundTransparency"] = 1;
		Tab["13"]["Position"] = UDim2.new(0, 0, 0.13385826349258423, 0);

		-- StarterGui.SimplifiedUI.Main.Nagivation.ButtonHolder.Inactive.UIPadding
		Tab["14"] = Instance.new("UIPadding", Tab["13"]);
		Tab["14"]["PaddingLeft"] = UDim.new(0, 28);

		-- StarterGui.SimplifiedUI.Main.Nagivation.ButtonHolder.Inactive.Icon
		Tab["15"] = Instance.new("ImageLabel", Tab["13"]);
		Tab["15"]["BorderSizePixel"] = 0;
		Tab["15"]["BackgroundColor3"] = Color3.fromRGB(166, 166, 166);
		Tab["15"]["AnchorPoint"] = Vector2.new(0, 0.5);
		Tab["15"]["Image"] = options.Icon;
		Tab["15"]["ImageRectSize"] = Vector2.new(36, 36);
		Tab["15"]["Size"] = UDim2.new(0, 20, 0, 20);
		Tab["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Tab["15"]["Name"] = [[Icon]];
		Tab["15"]["ImageRectOffset"] = Vector2.new(484, 44);
		Tab["15"]["BackgroundTransparency"] = 1;
		Tab["15"]["Position"] = UDim2.new(0, -22, 0.5, 0);
		Tab["15"]["ImageColor3"] = Color3.fromRGB(194,194,194)

		-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab
		Tab["1a"] = Instance.new("ScrollingFrame", GUI["18"]);
		Tab["1a"]["BorderSizePixel"] = 0;
		Tab["1a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Tab["1a"]["BackgroundTransparency"] = 1;
		Tab["1a"]["Size"] = UDim2.new(0.9569892287254333, 0, 0.9684014916419983, 0);
		Tab["1a"]["Selectable"] = false;
		Tab["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		Tab["1a"]["ScrollBarThickness"] = 1;
		Tab["1a"]["Position"] = UDim2.new(0.02150537632405758, 0, 0.00929368007928133, 0);
		Tab["1a"]["Name"] = options.Name.."Tab";
		Tab["1a"]["SelectionGroup"] = false;
		Tab["1a"]["Visible"] = false;
		Tab["1a"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
		
		-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.UIPadding
		Tab["21"] = Instance.new("UIPadding", Tab["1a"]);
		Tab["21"]["PaddingTop"] = UDim.new(0, 1);
		Tab["21"]["PaddingRight"] = UDim.new(0, 1);
		Tab["21"]["PaddingBottom"] = UDim.new(0, 1);
		Tab["21"]["PaddingLeft"] = UDim.new(0, 2);

		-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.UIListLayout
		Tab["22"] = Instance.new("UIListLayout", Tab["1a"]);
		Tab["22"]["Padding"] = UDim.new(0, 6);
		Tab["22"]["SortOrder"] = Enum.SortOrder.LayoutOrder;


		do
			function Tab:Activate()
				if not Tab.Active then
					if GUI.CurrentTab ~= nil then
						GUI.CurrentTab:Deactivate()
					end
					Tab.Active = true
					Library:tween(Tab['13'],{TextColor3 = Color3.fromRGB(255, 255, 255)})
					Library:tween(Tab['15'],{ImageColor3 = Color3.fromRGB(255, 255, 255)})
					Library:tween(Tab['13'],{BackgroundTransparency = 0.8})

					Tab["1a"].Visible = true

					GUI.CurrentTab = Tab
				end
			end

			function Tab:Deactivate()
				if Tab.Active then
					Tab.Active = false
					Tab.Hover = false
					Library:tween(Tab['13'],{TextColor3 = Color3.fromRGB(194, 194, 194)})
					Library:tween(Tab['15'],{ImageColor3 = Color3.fromRGB(194, 194, 194)})
					Library:tween(Tab['13'],{BackgroundTransparency = 1})
					GUI.CurrentTab["1a"].Visible = false

					GUI.CurrentTab = nil
				end
			end

			Tab["13"].MouseEnter:Connect(function()
				Tab.Hover = true
				if not Tab.Active then
					Library:tween(Tab['13'],{TextColor3 = Color3.fromRGB(255, 255, 255)})
					Library:tween(Tab['15'],{ImageColor3 = Color3.fromRGB(255, 255, 255)})
				end
			end)

			Tab["13"].MouseLeave:Connect(function()
				Tab.Hover = false
				if not Tab.Active then
					Library:tween(Tab['13'],{TextColor3 = Color3.fromRGB(194, 194, 194)})
					Library:tween(Tab['15'],{ImageColor3 = Color3.fromRGB(194, 194, 194)})
				end
			end)

			uis.InputBegan:Connect(function(input,gpe)
				if gpe then return end

				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if Tab.Hover then
						if not Tab.Active then
							Tab:Activate()
						end
					end
				end
			end)


			if GUI.CurrentTab == nil then
				Tab:Activate()
			end

		end

		function Tab:CreateButton(options)
			local options = options or {}
			Library:validate({
				Name = "Button",
				Callback = function()
					print("I have been clicked!")
				end,
			},options)

			local Button = {
				Hover = false,
				MouseDown = false
			}
			-- render
			do
				Button["1b"] = Instance.new("Frame", Tab["1a"]);
				Button["1b"]["BorderSizePixel"] = 0;
				Button["1b"]["BackgroundColor3"] = Color3.fromRGB(43, 43, 43);
				Button["1b"]["Size"] = UDim2.new(1, 0, 0, 32);
				Button["1b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["1b"]["Position"] = UDim2.new(-0.0037255517672747374, 0, -0.0007672336651012301, 0);
				Button["1b"]["Name"] = [[Button]];

				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeButton.Button.UICorner
				Button["1c"] = Instance.new("UICorner", Button["1b"]);


				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeButton.Button.UIStroke
				Button["1d"] = Instance.new("UIStroke", Button["1b"]);
				Button["1d"]["Color"] = Color3.fromRGB(108, 108, 108);

				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeButton.Button.Title
				Button["1e"] = Instance.new("TextLabel", Button["1b"]);
				Button["1e"]["BorderSizePixel"] = 0;
				Button["1e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["1e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Button["1e"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Button["1e"]["TextSize"] = 14;
				Button["1e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Button["1e"]["Size"] = UDim2.new(1, -20, 1, 0);
				Button["1e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["1e"]["Text"] = options.Name;
				Button["1e"]["Name"] = [[Title]];
				Button["1e"]["BackgroundTransparency"] = 1;

				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeButton.Button.UIPadding
				Button["1f"] = Instance.new("UIPadding", Button["1b"]);
				Button["1f"]["PaddingTop"] = UDim.new(0, 6);
				Button["1f"]["PaddingRight"] = UDim.new(0, 6);
				Button["1f"]["PaddingBottom"] = UDim.new(0, 6);
				Button["1f"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeButton.Button.Icon
				Button["20"] = Instance.new("ImageLabel", Button["1b"]);
				Button["20"]["BorderSizePixel"] = 0;
				Button["20"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Button["20"]["AnchorPoint"] = Vector2.new(1, 0);
				Button["20"]["Image"] = [[http://www.roblox.com/asset/?id=11181493955]];
				Button["20"]["Size"] = UDim2.new(0, 20, 0, 20);
				Button["20"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["20"]["Name"] = [[Icon]];
				Button["20"]["BackgroundTransparency"] = 1;
				Button["20"]["Position"] = UDim2.new(1, 0, 0, 0);
			end
			-- logic
			do
				Button["1b"].MouseEnter:Connect(function()
					Button.Hover = true
					if not Button.MouseDown then
						Library:tween(Button["1d"],{Color = Color3.fromRGB(125, 125, 125)})
					end
				end)
				Button["1b"].MouseLeave:Connect(function()
					Button.Hover = false
					if not Button.MouseDown then
						Library:tween(Button["1d"],{Color = Color3.fromRGB(85,85,85)})
					end
				end)
				uis.InputBegan:Connect(function(input,gpe)
					if gpe then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Button.Hover then
						Button.MouseDown = true
						Library:tween(Button["1b"],{BackgroundColor3 = Color3.fromRGB(113, 113, 113)})
						Library:tween(Button["1d"],{Color = Color3.fromRGB(199, 199, 199)})
						options.Callback()
					end
				end)
				uis.InputEnded:Connect(function(input,gpe)
					if gpe then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Button.MouseDown = false
						if Button.Hover then
							Library:tween(Button["1b"],{BackgroundColor3 = Color3.fromRGB(43,43,43)})
							Library:tween(Button["1d"],{Color = Color3.fromRGB(125,125,125)})
						else
							Library:tween(Button["1b"],{BackgroundColor3 = Color3.fromRGB(43,43,43)})
							Library:tween(Button["1d"],{Color = Color3.fromRGB(108,108,108)})
						end
					end
				end)
			end
			--methods
			do
				function Button:SetText(text)
					Button["1e"].Text = text
				end
				function Button:SetCallback(fn)
					options.Callback = fn
				end
			end
			return Button
		end

		function Tab:CreateWarning(options)
			local options = options or {}
			Library:validate({
				Name = "Warning",
			},options)

			local Warning = {}

			-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Warning
			Warning["28"] = Instance.new("Frame", Tab["1a"]);
			Warning["28"]["BorderSizePixel"] = 0;
			Warning["28"]["BackgroundColor3"] = Color3.fromRGB(50, 48, 4);
			Warning["28"]["Size"] = UDim2.new(1, 0, 0, 26);
			Warning["28"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Warning["28"]["Position"] = UDim2.new(-0.0037255517672747374, 0, -0.0007672336651012301, 0);
			Warning["28"]["Name"] = [[Warning]];

			-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Warning.UICorner
			Warning["29"] = Instance.new("UICorner", Warning["28"]);


			-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Warning.UIStroke
			Warning["2a"] = Instance.new("UIStroke", Warning["28"]);
			Warning["2a"]["Color"] = Color3.fromRGB(166, 152, 0);

			-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Warning.Title
			Warning["2b"] = Instance.new("TextLabel", Warning["28"]);
			Warning["2b"]["BorderSizePixel"] = 0;
			Warning["2b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Warning["2b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Warning["2b"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
			Warning["2b"]["TextSize"] = 14;
			Warning["2b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			Warning["2b"]["Size"] = UDim2.new(0.9047619104385376, 0, 1, 0);
			Warning["2b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Warning["2b"]["Text"] = options.Name;
			Warning["2b"]["Name"] = [[Title]];
			Warning["2b"]["BackgroundTransparency"] = 1;
			Warning["2b"]["Position"] = UDim2.new(0.095238097012043, 0, 0, 0);
			Warning["2b"]["TextWrapped"] = true
			Warning["2b"]["TextYAlignment"] = Enum.TextYAlignment.Top

			-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Warning.UIPadding
			Warning["2c"] = Instance.new("UIPadding", Warning["28"]);
			Warning["2c"]["PaddingTop"] = UDim.new(0, 6);
			Warning["2c"]["PaddingRight"] = UDim.new(0, 6);
			Warning["2c"]["PaddingBottom"] = UDim.new(0, 6);
			Warning["2c"]["PaddingLeft"] = UDim.new(0, 6);

			-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Warning.Icon
			Warning["2d"] = Instance.new("ImageLabel", Warning["28"]);
			Warning["2d"]["BorderSizePixel"] = 0;
			Warning["2d"]["BackgroundColor3"] = Color3.fromRGB(166, 166, 166);
			Warning["2d"]["AnchorPoint"] = Vector2.new(0, 0.5);
			Warning["2d"]["Image"] = [[rbxassetid://10950577510]];
			Warning["2d"]["Size"] = UDim2.new(0, 20, 0, 20);
			Warning["2d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Warning["2d"]["Name"] = [[Icon]];
			Warning["2d"]["BackgroundTransparency"] = 1;
			Warning["2d"]["Position"] = UDim2.new(0.0873015895485878, -22, 0.5, 0);

			function Warning:_update()
				Warning["2b"].Text = options.Name

				Warning["2b"].Size = UDim2.new(Warning["2b"].Size.X.Scale,Warning["2b"].Size.X.Offset,0,math.huge)
				Warning["2b"].Size = UDim2.new(Warning["2b"].Size.X.Scale,Warning["2b"].Size.X.Offset,0,Warning["2b"].TextBounds.Y)
				Warning["28"].Size = UDim2.new(Warning["28"].Size.X.Scale,Warning["28"].Size.X.Offset,0,Warning["2b"].TextBounds.Y + 12)
			end

			function Warning:SetText(text)
				Warning["2b"].Text = text
				options.Name = text
				Warning:_update()
			end
			Warning:_update()
			return Warning
		end

		function Tab:CreateInfo(options)
			local options = options or {}
			Library:validate({
				Name = "Info",
			},options)

			local Info = {}

			-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Info
			Info["2e"] = Instance.new("Frame", Tab["1a"]);
			Info["2e"]["BorderSizePixel"] = 0;
			Info["2e"]["BackgroundColor3"] = Color3.fromRGB(0, 50, 47);
			Info["2e"]["Size"] = UDim2.new(1, 0, 0, 26);
			Info["2e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Info["2e"]["Position"] = UDim2.new(-0.0037255517672747374, 0, -0.0007672336651012301, 0);
			Info["2e"]["Name"] = [[Info]];

			-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Info.UICorner
			Info["2f"] = Instance.new("UICorner", Info["2e"]);


			-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Info.UIStroke
			Info["30"] = Instance.new("UIStroke", Info["2e"]);
			Info["30"]["Color"] = Color3.fromRGB(0, 143, 204);

			-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Info.Title
			Info["31"] = Instance.new("TextLabel", Info["2e"]);
			Info["31"]["BorderSizePixel"] = 0;
			Info["31"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Info["31"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Info["31"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
			Info["31"]["TextSize"] = 14;
			Info["31"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			Info["31"]["Size"] = UDim2.new(0.9047619104385376, 0, 1, 0);
			Info["31"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Info["31"]["Text"] = options.Name;
			Info["31"]["Name"] = [[Title]];
			Info["31"]["BackgroundTransparency"] = 1;
			Info["31"]["Position"] = UDim2.new(0.095238097012043, 0, 0, 0);
			Info["31"]["TextWrapped"] = true
			Info["31"]["TextYAlignment"] = Enum.TextYAlignment.Top

			-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Info.UIPadding
			Info["32"] = Instance.new("UIPadding", Info["2e"]);
			Info["32"]["PaddingTop"] = UDim.new(0, 6);
			Info["32"]["PaddingRight"] = UDim.new(0, 6);
			Info["32"]["PaddingBottom"] = UDim.new(0, 6);
			Info["32"]["PaddingLeft"] = UDim.new(0, 6);

			-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Info.Icon
			Info["33"] = Instance.new("ImageLabel", Info["2e"]);
			Info["33"]["BorderSizePixel"] = 0;
			Info["33"]["BackgroundColor3"] = Color3.fromRGB(166, 166, 166);
			Info["33"]["ImageColor3"] = Color3.fromRGB(0, 222, 255);
			Info["33"]["AnchorPoint"] = Vector2.new(0, 0.5);
			Info["33"]["Image"] = [[rbxassetid://10950514227]];
			Info["33"]["Size"] = UDim2.new(0, 20, 0, 20);
			Info["33"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Info["33"]["Name"] = [[Icon]];
			Info["33"]["BackgroundTransparency"] = 1;
			Info["33"]["Position"] = UDim2.new(0.0873015895485878, -22, 0.5, 0);

			function Info:_update()
				Info["31"].Text = options.Name

				Info["31"].Size = UDim2.new(Info["31"].Size.X.Scale,Info["31"].Size.X.Offset,0,math.huge)
				Info["31"].Size = UDim2.new(Info["31"].Size.X.Scale,Info["31"].Size.X.Offset,0,Info["31"].TextBounds.Y)
				Info["2e"].Size = UDim2.new(Info["2e"].Size.X.Scale,Info["2e"].Size.X.Offset,0,Info["31"].TextBounds.Y + 12)
			end

			function Info:SetText(text)
				Info["31"].Text = text
				options.Name = text

				Info:_update()
			end
			Info:_update()
			return Info
		end

		function Tab:CreateLabel(options)
			local options = options or {}
			Library:validate({
				Name = "Label",
			},options)

			local Label = {}

			Label["23"] = Instance.new("Frame", Tab["1a"]);
			Label["23"]["BorderSizePixel"] = 0;
			Label["23"]["BackgroundColor3"] = Color3.fromRGB(53, 53, 53);
			Label["23"]["Size"] = UDim2.new(1, 0, 0, 32);
			Label["23"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Label["23"]["Position"] = UDim2.new(-0.0037255517672747374, 0, -0.0007672336651012301, 0);
			Label["23"]["Name"] = [[Label]];

			-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Label.UICorner
			Label["24"] = Instance.new("UICorner", Label["23"]);


			-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Label.UIStroke
			Label["25"] = Instance.new("UIStroke", Label["23"]);
			Label["25"]["Color"] = Color3.fromRGB(108, 108, 108);

			-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Label.Title
			Label["26"] = Instance.new("TextLabel", Label["23"]);
			Label["26"]["BorderSizePixel"] = 0;
			Label["26"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Label["26"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Label["26"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
			Label["26"]["TextSize"] = 14;
			Label["26"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			Label["26"]["Size"] = UDim2.new(1, -20, 1, 0);
			Label["26"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Label["26"]["Name"] = [[Title]];
			Label["26"]["BackgroundTransparency"] = 1;
			Label["26"]["Text"] = options.Name

			-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Label.UIPadding
			Label["27"] = Instance.new("UIPadding", Label["23"]);
			Label["27"]["PaddingTop"] = UDim.new(0, 6);
			Label["27"]["PaddingRight"] = UDim.new(0, 6);
			Label["27"]["PaddingBottom"] = UDim.new(0, 6);
			Label["27"]["PaddingLeft"] = UDim.new(0, 6);

			function Label:SetText(text)
				Label["26"].Text = text
				options.Name = text
				Label:_update()
			end
			function Label:_update()
				Label["26"].Text = options.Name

				Label["26"].Size = UDim2.new(Label["26"].Size.X.Scale,Label["26"].Size.X.Offset,0,math.huge)
				Label["26"].Size = UDim2.new(Label["26"].Size.X.Scale,Label["26"].Size.X.Offset,0,Label["26"].TextBounds.Y)
				Label["23"].Size = UDim2.new(Label["23"].Size.X.Scale,Label["23"].Size.X.Offset,0,Label["26"].TextBounds.Y + 12)
			end
			Label:_update()
			return Label
		end

		function Tab:CreateSlider(options)
			local options = options or {}
			Library:validate({
				Name = "Slider",
				Min = 15,
				Max = 60,
				Default = 30,
				Callback = function(value)
					print(value)
				end,
			},options)
			local Slider = {
				MouseDown = false,
				Hover = false,
				Connection = nil
			}
			-- render
			do
				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Slider
				Slider["34"] = Instance.new("Frame", Tab["1a"]);
				Slider["34"]["BorderSizePixel"] = 0;
				Slider["34"]["BackgroundColor3"] = Color3.fromRGB(43, 43, 43);
				Slider["34"]["Size"] = UDim2.new(1, 0, 0, 38);
				Slider["34"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["34"]["Position"] = UDim2.new(-0.0037255517672747374, 0, -0.0007672336651012301, 0);
				Slider["34"]["Name"] = [[Slider]];

				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Slider.UICorner
				Slider["35"] = Instance.new("UICorner", Slider["34"]);


				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Slider.UIStroke
				Slider["36"] = Instance.new("UIStroke", Slider["34"]);
				Slider["36"]["Color"] = Color3.fromRGB(108, 108, 108);

				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Slider.Title
				Slider["37"] = Instance.new("TextLabel", Slider["34"]);
				Slider["37"]["BorderSizePixel"] = 0;
				Slider["37"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["37"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Slider["37"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Slider["37"]["TextSize"] = 14;
				Slider["37"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["37"]["Size"] = UDim2.new(1, -24, 1, -10);
				Slider["37"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["37"]["Text"] = options.Name;
				Slider["37"]["Name"] = [[Title]];
				Slider["37"]["BackgroundTransparency"] = 1;

				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Slider.UIPadding
				Slider["38"] = Instance.new("UIPadding", Slider["34"]);
				Slider["38"]["PaddingTop"] = UDim.new(0, 6);
				Slider["38"]["PaddingRight"] = UDim.new(0, 6);
				Slider["38"]["PaddingBottom"] = UDim.new(0, 6);
				Slider["38"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Slider.Value
				Slider["39"] = Instance.new("TextLabel", Slider["34"]);
				Slider["39"]["BorderSizePixel"] = 0;
				Slider["39"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["39"]["TextXAlignment"] = Enum.TextXAlignment.Right;
				Slider["39"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Slider["39"]["TextSize"] = 14;
				Slider["39"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Slider["39"]["AnchorPoint"] = Vector2.new(1, 0);
				Slider["39"]["Size"] = UDim2.new(0, 24, 1, -10);
				Slider["39"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["39"]["Text"] = tostring(options.Default);
				Slider["39"]["Name"] = [[Value]];
				Slider["39"]["BackgroundTransparency"] = 1;
				Slider["39"]["Position"] = UDim2.new(1, 0, 0, 0);

				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Slider.SliderBack
				Slider["3a"] = Instance.new("Frame", Slider["34"]);
				Slider["3a"]["BorderSizePixel"] = 0;
				Slider["3a"]["BackgroundColor3"] = Color3.fromRGB(25, 25, 25);
				Slider["3a"]["AnchorPoint"] = Vector2.new(0, 1);
				Slider["3a"]["Size"] = UDim2.new(1, 0, 0, 4);
				Slider["3a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["3a"]["Position"] = UDim2.new(0, 0, 1, 0);
				Slider["3a"]["Name"] = [[SliderBack]];

				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Slider.SliderBack.UICorner
				Slider["3b"] = Instance.new("UICorner", Slider["3a"]);


				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Slider.SliderBack.UIStroke
				Slider["3c"] = Instance.new("UIStroke", Slider["3a"]);
				Slider["3c"]["Color"] = Color3.fromRGB(68, 68, 68);

				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.Slider.SliderBack.Draggable
				Slider["3d"] = Instance.new("Frame", Slider["3a"]);
				Slider["3d"]["BorderSizePixel"] = 0;
				Slider["3d"]["BackgroundColor3"] = Color3.fromRGB(66, 66, 66);
				Slider["3d"]["Size"] = UDim2.new(0.5, 0, 1, 0);
				Slider["3d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Slider["3d"]["Name"] = [[Draggable]];

				Slider["15b"] = Instance.new("UICorner", Slider["3d"]);
			end

			-- methods
			do
				function Slider:SetValue(v)
					if v == nil then
						local percentage = math.clamp((mouse.X - Slider["3a"].AbsolutePosition.X) / (Slider["3a"].AbsoluteSize.X), 0, 1)
						local value = math.floor((options.Max - options.Min) * percentage) + options.Min

						Slider["39"].Text = tostring(value)
						Slider["3d"].Size = UDim2.fromScale(percentage,1)
					else
						Slider["39"].Text = tostring(v)
						Slider["3d"].Size = UDim2.fromScale(((v - options.Min) / (options.Max - options.Min)), 1)
					end
					options.Callback(Slider:GetValue())
				end

				function Slider:GetValue()
					return tonumber(Slider["39"].Text)
				end
			end

			-- logic
			do
				Slider["34"].MouseEnter:Connect(function()
					Slider.Hover = true
					if not Slider.MouseDown then
						Library:tween(Slider["36"],{Color = Color3.fromRGB(125, 125, 125)})
						Library:tween(Slider["3d"],{BackgroundColor3 = Color3.fromRGB(131, 131, 131)})
					end
				end)
				Slider["34"].MouseLeave:Connect(function()
					Slider.Hover = false
					if not Slider.MouseDown then
						Library:tween(Slider["36"],{Color = Color3.fromRGB(85,85,85)})
						Library:tween(Slider["3d"],{BackgroundColor3 = Color3.fromRGB(66,66,66)})
					end
				end)
				uis.InputBegan:Connect(function(input,gpe)
					if gpe then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Slider.Hover then
						Slider.MouseDown = true
						Library:tween(Slider["34"],{BackgroundColor3 = Color3.fromRGB(113, 113, 113)})
						Library:tween(Slider["36"],{Color = Color3.fromRGB(199, 199, 199)})
						Library:tween(Slider["3d"],{BackgroundColor3 = Color3.fromRGB(207, 207, 207)})
						if not Slider.Connection then
							Slider.Connection = RunService.RenderStepped:Connect(function()
								Slider:SetValue()
							end)
						end
					end
				end)
				uis.InputEnded:Connect(function(input,gpe)
					if gpe then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Slider.MouseDown = false
						if Slider.Hover then
							Library:tween(Slider["34"],{BackgroundColor3 = Color3.fromRGB(43,43,43)})
							Library:tween(Slider["36"],{Color = Color3.fromRGB(125,125,125)})
						else
							Library:tween(Slider["34"],{BackgroundColor3 = Color3.fromRGB(43,43,43)})
							Library:tween(Slider["36"],{Color = Color3.fromRGB(108,108,108)})
						end
						if Slider.Connection then Slider.Connection:Disconnect() end
						Slider.Connection = nil
					end
				end)

			end
			Slider:SetValue(options.Default)
			return Slider
		end

		function Tab:CreateToggle(options)
			local options = options or {}
			Library:validate({
				Name = "Toggle",
				Callback = function(bool)
					print(bool)
				end,
			},options)

			local Toggle = {
				Hover = false,
				MouseDown = false,
				State = false
			}

			-- render
			do
				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.ToggleInactive
				Toggle["59"] = Instance.new("Frame", Tab["1a"]);
				Toggle["59"]["BorderSizePixel"] = 0;
				Toggle["59"]["BackgroundColor3"] = Color3.fromRGB(43, 43, 43);
				Toggle["59"]["Size"] = UDim2.new(1, 0, 0, 32);
				Toggle["59"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["59"]["Position"] = UDim2.new(-0.0037255517672747374, 0, -0.0007672336651012301, 0);
				Toggle["59"]["Name"] = [[ToggleInactive]];

				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.ToggleInactive.UICorner
				Toggle["5a"] = Instance.new("UICorner", Toggle["59"]);


				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.ToggleInactive.UIStroke
				Toggle["5b"] = Instance.new("UIStroke", Toggle["59"]);
				Toggle["5b"]["Color"] = Color3.fromRGB(108, 108, 108);

				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.ToggleInactive.Title
				Toggle["5c"] = Instance.new("TextLabel", Toggle["59"]);
				Toggle["5c"]["BorderSizePixel"] = 0;
				Toggle["5c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["5c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
				Toggle["5c"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Toggle["5c"]["TextSize"] = 14;
				Toggle["5c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["5c"]["Size"] = UDim2.new(1, -26, 1, 0);
				Toggle["5c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["5c"]["Text"] = options.Name;
				Toggle["5c"]["Name"] = [[Title]];
				Toggle["5c"]["BackgroundTransparency"] = 1;

				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.ToggleInactive.UIPadding
				Toggle["5d"] = Instance.new("UIPadding", Toggle["59"]);
				Toggle["5d"]["PaddingTop"] = UDim.new(0, 6);
				Toggle["5d"]["PaddingRight"] = UDim.new(0, 6);
				Toggle["5d"]["PaddingBottom"] = UDim.new(0, 6);
				Toggle["5d"]["PaddingLeft"] = UDim.new(0, 6);

				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.ToggleInactive.CheckmarkHolder
				Toggle["5e"] = Instance.new("Frame", Toggle["59"]);
				Toggle["5e"]["BorderSizePixel"] = 0;
				Toggle["5e"]["BackgroundColor3"] = Color3.fromRGB(66, 66, 66);
				Toggle["5e"]["AnchorPoint"] = Vector2.new(1, 0.5);
				Toggle["5e"]["Size"] = UDim2.new(0, 16, 0, 16);
				Toggle["5e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["5e"]["Position"] = UDim2.new(1, 0, 0.5, 0);
				Toggle["5e"]["Name"] = [[CheckmarkHolder]];

				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.ToggleInactive.CheckmarkHolder.UICorner
				Toggle["5f"] = Instance.new("UICorner", Toggle["5e"]);
				Toggle["5f"]["CornerRadius"] = UDim.new(0, 4);

				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.ToggleInactive.CheckmarkHolder.UIStroke
				Toggle["60"] = Instance.new("UIStroke", Toggle["5e"]);
				Toggle["60"]["Color"] = Color3.fromRGB(108, 108, 108);

				-- StarterGui.SimplifiedUI.Main.ContentContainer.HomeTab.ToggleInactive.CheckmarkHolder.ImageLabel
				Toggle["61"] = Instance.new("ImageLabel", Toggle["5e"]);
				Toggle["61"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Toggle["61"]["ImageTransparency"] = 1;
				Toggle["61"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
				Toggle["61"]["Image"] = [[rbxassetid://11182294856]];
				Toggle["61"]["Size"] = UDim2.new(1, -2, 1, -2);
				Toggle["61"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Toggle["61"]["BackgroundTransparency"] = 1;
				Toggle["61"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
			end

			do
				function Toggle:Toggle(b)
					if b == nil then
						Toggle.State = not Toggle.State
					else
						Toggle.State = b
					end

					if Toggle.State then
						Library:tween(Toggle["5e"],{BackgroundColor3 = Color3.fromRGB(136, 255, 0)})
						Library:tween(Toggle["61"],{ImageTransparency = 0})
					else
						Library:tween(Toggle["5e"],{BackgroundColor3 = Color3.fromRGB(66, 66, 66)})
						Library:tween(Toggle["61"],{ImageTransparency = 1})
					end			

					options.Callback(Toggle.State)
				end
			end

			-- logic
			do
				Toggle["59"].MouseEnter:Connect(function()
					Toggle.Hover = true
					if not Toggle.MouseDown then
						Library:tween(Toggle["5b"],{Color = Color3.fromRGB(125, 125, 125)})
					end
				end)
				Toggle["59"].MouseLeave:Connect(function()
					Toggle.Hover = false
					if not Toggle.MouseDown then
						Library:tween(Toggle["5b"],{Color = Color3.fromRGB(85,85,85)})
					end
				end)
				uis.InputBegan:Connect(function(input,gpe)
					if gpe then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 and Toggle.Hover then
						Toggle.MouseDown = true
						Library:tween(Toggle["59"],{BackgroundColor3 = Color3.fromRGB(113, 113, 113)})
						Library:tween(Toggle["5b"],{Color = Color3.fromRGB(199, 199, 199)})
						Toggle:Toggle()
					end
				end)
				uis.InputEnded:Connect(function(input,gpe)
					if gpe then return end
					if input.UserInputType == Enum.UserInputType.MouseButton1 then
						Toggle.MouseDown = false
						if Toggle.Hover then
							Library:tween(Toggle["59"],{BackgroundColor3 = Color3.fromRGB(43,43,43)})
							Library:tween(Toggle["5b"],{Color = Color3.fromRGB(163, 163, 163)})
						else
							Library:tween(Toggle["59"],{BackgroundColor3 = Color3.fromRGB(43,43,43)})
							Library:tween(Toggle["5b"],{Color = Color3.fromRGB(108, 108, 108)})
						end
					end
				end)


			end

			return Toggle
		end

		return Tab
	end

	return GUI
end


return Library
