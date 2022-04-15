return {
    {
        name = "init_scores",
        func = function()
            local space = box.schema.space.create(
                    "scores",
                    {
                        engine = "memtx",
                        if_not_exists = true
                    }
            )
            space:format({
                { name = "game_id", type = "string" },
                { name = "name", type = "string" },
                { name = "points", type = "integer" },
                { name = "expires_at", type = "integer" },
            })

            space:create_index("game_id", {
                type = "hash",
                unique = true,
                parts = { "game_id" },
                if_not_exists = true
            })
            space:create_index("name", {
                type = "hash",
                unique = true,
                parts = { "name" },
                if_not_exists = true
            })
        end
    },
}
