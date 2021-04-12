﻿-- This file is subject to copyright - contact swampservers@gmail.com for more information.
-- INSTALL: CINEMA

SS_Tab("Playermodels","user_suit")


PS_ItemProduct({
    class = "outfitter",
    price = 1000000,
    name = 'SELL-ONLY Outfitter',
    description = "asdfdf",
    model = 'models/player/pyroteknik/banana.mdl',
    invcategory = "Playermodels",
    never_equip = true
})
PS_ProductlessItem({
    class = "whiteeyestest",
    name = "white eyes",
    description = "does nothing. sell me.",
    price = 2000000,
    model = "models/error.mdl",
    material = "models/debug/debugwhite",
})



SS_Heading("Mods")

PS_ItemProduct({
    class = "inflater",
    price = 200000,
    name = 'Inflater',
    description = "make bones fatter or skeletoner. MULTIPLE CAN STACK",
    model = 'models/Gibs/HGIBS.mdl', --'models/Gibs/HGIBS_rib.mdl',
    material = 'models/debug/debugwhite',
    invcategory = "Mods",
    maxowned = 25,
    bonemod = true,
    configurable = {
        scale = {
            xs = {
                min = 0.5,
                max = 1.5
            },
            ys = {
                min = 0.5,
                max = 1.5
            },
            zs = {
                min = 0.5,
                max = 1.5
            }
        },
        bone = true,
        scale_children = true
    }
})

PS_ItemProduct({
    class = "offsetter",
    price = 100000,
    name = 'Offsetter',
    description = "moves bones around by using advanced genetic modification",
    model = 'models/Gibs/HGIBS_rib.mdl',
    material = 'models/debug/debugwhite',
    invcategory = "Mods",
    maxowned = 25,
    bonemod = true,
    configurable = {
        pos = {
            x = {
                min = -8,
                max = 8
            },
            y = {
                min = -8,
                max = 8
            },
            z = {
                min = -8,
                max = 8
            }
        },
        bone = true
    }
})


SS_Heading("Permanent")

PS_ItemProduct({
    class = "outfitter2",
    price = 2000000,
    name = 'Outfitter',
    description = "Allows wearing any model from workshop - type !outfitter",
    model = 'models/player/pyroteknik/banana.mdl',
    invcategory = "Playermodels",
    never_equip = true
})

if SERVER then
    timer.Create("syncoutfitter", 1, 0, function()
        for k, v in pairs(player.GetAll()) do
            if v:GetNWBool("oufitr") ~= v:PS_HasItem("outfitter2") then
                v:SetNWBool("oufitr", v:PS_HasItem("outfitter2"))
            end
        end
    end)
end

hook.Add("CanOutfit", "ps_outfitter", function(ply, mdl, wsid) return ply:GetNWBool("oufitr") end)



PS_PlayermodelItemProduct({
    class = 'crusadermodel',
    price = 300000,
    name = 'Crusader',
    model = 'models/player/crusader.mdl',
    PlayerSetModel = function(self, ply)
        ply:Give("weapon_deusvult")
        ply:SelectWeapon("weapon_deusvult")
    end
})

PS_PlayermodelItemProduct({
    class = 'jokermodel',
    price = 180000,
    name = 'The Joker',
    description = "Now yuo see...",
    model = 'models/player/bobert/aojoker.mdl',
    PlayerSetModel = function(self, ply) end
})

PS_PlayermodelItemProduct({
    class = 'minecraftmodel',
    price = 400064,
    name = 'Block Man',
    description = "A Minecraft player model capable of applying custom skins.",
    model = 'models/milaco/minecraft_pm/minecraft_pm.mdl',
    PlayerSetModel = function(self, ply) end
})

PS_PlayermodelItemProduct({
    class = 'neckbeardmodel',
    price = 240000,
    name = 'Athiest',
    model = 'models/player/neckbeard.mdl',
    PlayerSetModel = function(self, ply)
        ply:Give("weapon_clopper")
        ply:SelectWeapon("weapon_clopper")
    end
})

PS_PlayermodelItemProduct({
    class = 'ogremodel',
    price = 100000,
    name = 'Ogre',
    description = "IT CAME FROM THE SWAMP",
    model = 'models/player/pyroteknik/shrek.mdl',
    PlayerSetModel = function(self, ply) end
})

PS_PlayermodelItemProduct({
    class = 'ponymodel',
    price = 500000,
    name = 'Pony',
    description = "*boop*",
    model = 'models/ppm/player_default_base.mdl',
    PlayerSetModel = function(self, ply)
        ply:Give("weapon_squee")
        ply:SelectWeapon("weapon_squee")
    end
})

SS_Heading("One-Life, Unique")

PS_UniqueModelProduct({
    class = 'celestia',
    name = 'Sun Princess',
    model = 'models/mlp/player_celestia.mdl',
    CanBuyStatus = function(self, ply)
        if not ply:PS_HasItem("ponymodel") then return PS_BUYSTATUS_PONYONLY end
    end
})

PS_UniqueModelProduct({
    class = 'luna',
    name = 'Moon Princess',
    model = 'models/mlp/player_luna.mdl',
    CanBuyStatus = function(self, ply)
        if not ply:PS_HasItem("ponymodel") then return PS_BUYSTATUS_PONYONLY end
    end
})

PS_UniqueModelProduct({
    class = 'billyherrington',
    name = 'Billy Herrington',
    description = "Rest in peace Billy Herrington, you will be missed.",
    model = 'models/vinrax/player/billy_herrington.mdl',
    OnBuy = function(self, ply)
        if SERVER then
            ply:Give("weapon_billyh")
            ply:SelectWeapon("weapon_billyh")
        end
    end
})

PS_UniqueModelProduct({
    class = 'doomguy',
    name = 'Doomslayer',
    description = "They are rage, brutal, without mercy. But you. You will be worse. Rip and tear, until it is done.",
    model = 'models/pechenko_121/doomslayer.mdl',
    OnBuy = function(self, ply) end
})

-- PS_UniqueModelProduct({
-- 	class = 'ketchupdemon',
-- 	name = 'Mortally Challenged',
-- 	description = '"Demon" is an offensive term.',
-- 	model = 'models/momot/momot.mdl'
-- })
PS_UniqueModelProduct({
    class = 'fatbastard',
    name = 'Fat Bastard',
    model = 'models/obese_male.mdl'
})

PS_UniqueModelProduct({
    class = 'fox',
    name = 'Furball',
    description = "Furries are proof that God has abandoned us.",
    model = 'models/player/ztp_nickwilde.mdl'
})

PS_UniqueModelProduct({
    class = 'garfield',
    name = 'Lasagna Cat',
    description = "I gotta have a good meal.",
    model = 'models/garfield/garfield.mdl'
})

PS_UniqueModelProduct({
    class = 'hitler',
    name = 'Der Fuhrer',
    model = 'models/minson97/hitler/hitler.mdl'
})

PS_UniqueModelProduct({
    class = 'kermit',
    name = 'Frog',
    model = 'models/player/kermit.mdl'
})

-- PS_UniqueModelProduct({
-- 	class = 'kim',
-- 	name = 'Rocket Man',
-- 	description = "Won't be around much longer.",
-- 	model = 'models/player/hhp227/kim_jong_un.mdl'
-- })
PS_UniqueModelProduct({
    class = 'minion',
    name = 'Comedy Pill',
    model = 'models/player/minion/minion5/minion5.mdl'
})

-- PS_UniqueModelProduct({
-- 	class = 'moonman',
-- 	name = 'Mac Tonight',
-- 	model = 'models/player/moonmankkk.mdl'
-- })
PS_UniqueModelProduct({
    class = 'nicestmeme',
    name = 'Thanks, Lori.',
    description = 'John, haha. Where did you find this one?',
    model = 'models/player/pyroteknik/banana.mdl'
})

PS_UniqueModelProduct({
    class = 'pepsiman',
    name = 'Pepsiman',
    description = 'DRINK!',
    model = 'models/player/real/prawnmodels/pepsiman.mdl'
})

PS_UniqueModelProduct({
    class = 'rick',
    name = 'Intellectual',
    description = 'To be fair, you have to have a very high IQ to understand Rick and Morty.',
    model = 'models/player/rick/rick.mdl'
})

PS_UniqueModelProduct({
    class = 'trump',
    name = 'God Emperor',
    description = "Donald J. Trump is the President-for-life of the United States of America, destined savior of Kekistan, and slayer of Hillary the Crooked.",
    model = 'models/omgwtfbbq/the_ship/characters/trump_playermodel.mdl'
})

PS_UniqueModelProduct({
    class = 'weeaboo',
    name = 'Weeaboo Trash',
    description = "Two nukes wasn't enough.",
    model = 'models/tsumugi.mdl'
})

-- TODO: make them download/mount on the server, make sure there is not a lua backdoor!
PS_UniqueModelProduct({
    class = 'jokerjoker',
    name = 'Joker from JOKER',
    description = "A test for now...",
    model = 'models/kemot44/models/joker_pm.mdl',
    workshop = "1899345304",
})