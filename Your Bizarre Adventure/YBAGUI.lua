local function Notify(Title, Text, Duration)
    local NotificationBindable = Instance.new("BindableFunction")
    NotificationBindable.OnInvoke = (function(text) end)

    game.StarterGui:SetCore("SendNotification", {
        Title = Title;
        Text = Text;
        Duration = Duration;
        Callback = NotificationBindable;
    })
end

while wait(0.1) do
   setclipboard("https://discord.gg/kUbfAgy5Pu")
   Notify("Discontinued", "The free version has been Discontinued! You need to buy the paid Version in order to keep using it!", 5)
end
