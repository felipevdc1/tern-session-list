-- Tests for lib/painel.luau: does a tab already hold a list block.

local painel = require("../lib/painel")

local function eq(a, b, msg)
	if a ~= b then
		error(string.format("%s: expected %s, got %s", msg or "eq", tostring(b), tostring(a)), 2)
	end
end

local KIND = "session-list.list"

local panes = {
	{ pane = 1, tab = 10, block = nil },
	{ pane = 2, tab = 10, block = "other.thing" },
	{ pane = 3, tab = 11, block = KIND },
}

return {
	{ "a tab with a list block has one", function()
		eq(painel.temBloco(panes, 11, KIND), true)
	end },
	{ "a tab with only an agent pane and another block has none", function()
		eq(painel.temBloco(panes, 10, KIND), false)
	end },
	{ "an unknown tab has none", function()
		eq(painel.temBloco(panes, 99, KIND), false)
	end },
	{ "a nil tab never matches (cannot tell, so do not block opening)", function()
		eq(painel.temBloco({ { pane = 5, tab = nil, block = KIND } }, nil, KIND), false)
	end },
	{ "no panes", function()
		eq(painel.temBloco({}, 10, KIND), false)
	end },
} :: { any }
