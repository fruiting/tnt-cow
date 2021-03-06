--local t = require("luatest")
--local g = t.group("scores")
--local model = require("model.scores")
--
--g.test_set_validate = function()
--    local values = {
--        {
--            {
--                1, "Roman", 50, 1634204874,
--            },
--            "game_id should be string"
--        },
--        {
--            {
--                "123", 1, 50, 1634204874,
--            },
--            "name should be string"
--        },
--        {
--            {
--                "123", "Roman", "50", 1634204874,
--            },
--            "score should be number"
--        },
--        {
--            {
--                "123", "Roman", 50, "1634204874",
--            },
--            "expires_at should be number"
--        },
--    }
--
--    for _, value in pairs(values) do
--        local fn = function()
--            model.set(unpack(value[1]))
--        end
--        t.assert_error_msg_contains(value[2], fn)
--    end
--end