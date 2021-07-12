local function getClosestItem()
    local closestItem = nil;
    local closestItemDistance = math.huge;
    for _, v in pairs(game:GetService("Workspace"):GetChildren()) do
        if(v:FindFirstChild("Part") and v:FindFirstChild("Spawn")  and v.Name ~= "Trinkets") then
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
        wait(1)
        local closestItem = getClosestItem();
        local item = closestItem[1];
        local distance = closestItem[2];
    
        Tween = game:GetService("TweenService"):Create(
            game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(distance/getgenv().speed, Enum.EasingStyle.Linear),
            {Position = item.Part.Position + Vector3.new(0, -4, 0)}
        );
    
        Tween:Play();
        Tween.Completed:Wait();
    
        keypress(0x45);
        wait(math.random(100, 500)/1000);
        keyrelease(0x45);
    end

end)()
