---- This file is required automatically by luatest.
---- Add common configuration here.
--
--local fio = require("fio")
--local t = require("luatest")
--local package = require("package")
--
--local helper = {}
--
--helper.root = fio.dirname(fio.abspath(package.search("app")))
--helper.datadir = fio.pathjoin(helper.root, "tnt")
--helper.port = 3331
--
--t.before_suite(function()
--    fio.rmtree(helper.datadir)
--    fio.mktree(helper.datadir)
--end)
--
--t.after_suite(function()
--    fio.rmtree(helper.datadir)
--end )
--
--return helper
