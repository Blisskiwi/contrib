﻿-- This file is subject to copyright - contact swampservers@gmail.com for more information.
local OwOemotes = {"OwO", "owo", "UwU", "uwu", "TwT", ">w<", ">wO", "Ow<", ":3c", ":3", ":33", ":333", "nya", "(> owo )>", "(> owo <)", "*pounces on you*", "*glomps u*", "mrowww", "~", ":owo:", ":uwu:", ":awoo:", ":blush:", ":catgirl:", ":pat:", ":snug:", ":thinkerfelix:", ":weebblush1:", ":weebears:", ":widetrap:"}

--Add more emotes here
local function OwOifier(text)
    local splitstring = string.Split(text, "")
    local isemoteenabled = false

    if string.find(splitstring[1], "[!/]") then
        isemoteenabled = true
    end

    for k, v in pairs(splitstring) do
        --Keep emotes and chat colors the same
        if string.find(v, "[:;%[%]]") then
            isemoteenabled = not isemoteenabled
        elseif v == " " then
            isemoteenabled = false
        end

        if not isemoteenabled then
            if splitstring[k + 1] then
                --n(vowel) to ny(vowel)
                for nyaaa in string.gmatch(splitstring[k] .. splitstring[k + 1], "[Nn][aeiouAEIOU]") do
                    if v == v:lower() then
                        splitstring[k] = "ny"
                    else
                        splitstring[k] = "NY"
                    end
                end
            end

            --R and L to W
            if string.find(v, "[RrLl]") then
                if v == v:lower() then
                    splitstring[k] = "w"
                else
                    splitstring[k] = "W"
                end
            end
        end
    end

    local owotext = table.concat(splitstring)
    local owotext = string.gsub(owotext, "this", "dis")
    local owotext = string.gsub(owotext, "THIS", "DIS")
    local owotext = owotext .. " " .. OwOemotes[math.random(#OwOemotes)] --add a random emote at the end

    return owotext
end

hook.Add("PlayerSay", "ChatOwOifier", function(ply, text, team)
    if ply.OwOEnabled then return OwOifier(text) end
end)

RegisterChatCommand({'owo', 'uwu', 'toggleowo', 'toggleuwu'}, function(ply, arg)
    ply.OwOEnabled = not ply.OwOEnabled
    ply:ChatPrint("[pink]owo " .. (ply.OwOEnabled and "enabled" or "disabled"))
end, {
    global = true,
    throttle = true
})
