-- Does a tab already hold a list block? Pure: no `tern` global.
--
--   painel.temBloco(panes, tab, kind) -> boolean
--     panes = array of { pane, tab, block } (the window's PaneInfo)
--     tab   = the tab to look in (nil: unknown, answers false)
--     kind  = the block kind of the list
-- There is no block-args field on PaneInfo, so the check is per tab: the
-- design is one list block per tab.

local painel = {}

function painel.temBloco(panes: { any }, tab: any, kind: string): boolean
	if tab == nil then
		return false
	end
	for _, info in panes do
		if info.tab == tab and info.block == kind then
			return true
		end
	end
	return false
end

return painel
