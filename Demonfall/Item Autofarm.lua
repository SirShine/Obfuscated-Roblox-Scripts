
if(not getgenv().priority) then
    setclipboard("https://v3rmillion.net/showthread.php?tid=1126241&pid=7963821");
    game:GetService("Players").LocalPlayer:Kick("Please get the new version from V3rmillion! The link has been copied to your clipboard!");
    return;
end

local function getClosestItem()
    local closestItem = nil;
    local closestItemDistance = math.huge;

    for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
        if(v:FindFirstChild("Part") and v:FindFirstChild("Spawn") and v.Name ~= "Trinkets") then

            if(table.find(getgenv().priority, v.Name)) then
                return {v, game:GetService("Players").LocalPlayer:DistanceFromCharacter(v.Part.Position)};
            end

            local distance = game:GetService("Players").LocalPlayer:DistanceFromCharacter(v.Part.Position);

            if(distance < closestItemDistance) then
                closestItem = v;
                closestItemDistance = distance;
            end
            
        end
    end
    return {closestItem, closestItemDistance};
end

game:GetService('RunService').Stepped:connect(function()
    if(getgenv().enabled == true) then
	    game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11);
    end
end)

coroutine.wrap(function()

    local Tween = nil;
    while getgenv().enabled == true do
        game:GetService("RunService").Heartbeat:Wait();
        local closestItem = getClosestItem();
        local item = closestItem[1];
        local distance = closestItem[2];
    
        Tween = game:GetService("TweenService"):Create(
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(distance/getgenv().speed, Enum.EasingStyle.Linear),
            {Position = item.Part.Position + getgenv().offset}
        );
    
        Tween:Play();
        Tween.Completed:Wait();
    
        keypress(0x45);
        game:GetService("RunService").Heartbeat:Wait();
        keyrelease(0x45);
    end

end)()
