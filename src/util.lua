local util = {}

--- Определяет является ли аргумент числом типа int64
--- @param arg any проверяемое значение
--- @return boolean является ли значение числом типа int64
function util.is_int64(arg)
    local ffi = require("ffi")
    if type(arg) == "number" then
        return (arg > -2^53) and (arg < 2^53) and (math.floor(arg) == arg)
    end

    if type(arg) == "cdata" then
        if ffi.istype("int64_t", arg) then
            return true
        elseif ffi.istype("uint64_t", arg) then
            return arg < 2^63
        end
    end

    return false
end

return util
