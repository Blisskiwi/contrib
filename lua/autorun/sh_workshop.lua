﻿STEAMWS_DOWNLOAD_STARTED = STEAMWS_DOWNLOAD_STARTED or {}
STEAMWS_MOUNTED = STEAMWS_MOUNTED or {}

--placeholder: models/maxofs2d/logo_gmod_b.mdl

function require_workshop(id)
    if not STEAMWS_DOWNLOAD_STARTED[id] then
        STEAMWS_DOWNLOAD_STARTED[id] = true
        print("\n\n***DOWNLOADING " .. id .. "***\n\n")
        local _id_ = id

        steamworks.DownloadUGC(id, function(name, file)
            -- NOTE:
            -- Any error models currently loaded that the mounted addon provides will be reloaded.
            -- Any error materials currently loaded that the mounted addon provides will NOT be reloaded.
            -- That means that this cannot be used to fix missing map materials, as the map materials are loaded before you are able to call this.
            if name then
                game.MountGMA(name)
                STEAMWS_MOUNTED[_id_] = true
            else
                print("Workshop download failed for ".._id_)
                STEAMWS_DOWNLOAD_STARTED[_id_] = nil
            end
        end)
    end

    return STEAMWS_MOUNTED[id] or false
end

STEAMWS_REGISTRY = STEAMWS_REGISTRY or {}

function register_workshop_model(mdl, wsid)
    STEAMWS_REGISTRY[mdl] = wsid
end

function require_workshop_model(mdl)
    if STEAMWS_REGISTRY[mdl] then
        return require_workshop(STEAMWS_REGISTRY[mdl])
    else
        -- assume its built in
        return true
    end
end