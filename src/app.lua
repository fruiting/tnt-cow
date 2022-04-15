#!/usr/bin/env tarantool

-- Возвращает переменную окружения
-- или значение по-умолчанию, если переменная окружения не задана
local function getEnv(key, default)
    local value = os.getenv(key)
    if value == nil then
        return default
    end

    return value
end

local config = {
    --- Memory limit (in bytes)
    --- @type number
    memory_limit = tonumber(getEnv("TNT_MEMORY_LIMIT", 256 * 1024 * 1024)),
    --- Application port
    --- @type number
    listen = tonumber(getEnv("TNT_LISTEN", 3301)),
    --- Log level
    --- @type number
    log_level = tonumber(getEnv("TNT_LOG_LEVEL", 5)),
    --- Log format
    --- @type string
    log_format = getEnv("TNT_LOG_FORMAT", "json"),

    --- User to connect
    --- @type string
    mic_user = getEnv("TNT_USER", "tarantool"),
    --- Password to connect
    --- @type string
    mic_pasword = getEnv("TNT_PASSWORD", "tarantool"),
}

box.cfg {
    listen = config.listen,
    memtx_memory = config.memory_limit,
    log_level = config.log_level,
    log_format = config.log_format,
    wal_dir = "/var/lib/tarantool",
    memtx_dir = "/var/lib/tarantool",
    vinyl_dir = "/var/lib/tarantool",
}

box.once("bootstrap", function()
    box.schema.user.create(config.mic_user, { password = config.mic_pasword })
    box.schema.user.grant(config.mic_user, "create,read,write,execute", "universe")
end)

require("preinit")
