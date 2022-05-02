local model = require("model.scores")
local scores = {}

scores.set = {}
--- Sets player score
--- @param game_id string Game id
--- @param name string Player name
--- @param score number Player score
--- @param expires_at number TTL
function scores.set.v1(game_id, name, score, expires_at)
    model.set(game_id, name, score, expires_at)
end

scores.get = {}
--- Returns player's score
--- @param game_id string Game id
--- @param name string Player name
--- @return table
function scores.get.v1(game_id, name)
    return model.get(game_id, name)
end

return scores
