--- Global variable to help an application to call API methods
API = require("api")
--- Global variable of module to watch expiration of time
expirationd = require("expirationd")
--- Global variable to work with fibers
fiber = require("fiber")

local migrator = require("migrator")
migrator.migrate(require("migrations"))

--- Deletes expired scores
function clean_expired_scores()
    local function is_expired(args, tuple)
        local expiresAt = tuple[4]
        if expiresAt == nil then
            return false
        end
        return expiresAt < fiber.time()
    end

    expirationd.start(
            'clean_expired_scores',
            box.space.scores.id,
            is_expired,
            {
                args = nil,
                force = true,
                tuples_per_iteration = 10000,
                full_scan_time = 3600
            })
end

clean_expired_scores()
