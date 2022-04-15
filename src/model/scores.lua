local model = {
    space_name = "scores",
    index = {
        game_id = "game_id",
        name = "name",
    },
    fields = {
        game_id = 1,
        name = 2,
        score = 3,
        expires_at = 4
    }
}

require("test.helper.api")

--- Adds/replaces player's score
--- @param game_id string Game id
--- @param name string Player name
--- @param score number Player score
--- @param expires_at number TTL
function model.set(game_id, name, score, expires_at)
    local util = require("util")

    assert(type(game_id) == "string", "game_id should be string")
    assert(type(name) == "string", "name should be string")
    assert(type(score) == "number", "score should be number")
    assert(util.is_int64(expires_at), "expires_at should be number")

    box.space[model.space_name]:replace({ game_id, name, score, expires_at })
end
