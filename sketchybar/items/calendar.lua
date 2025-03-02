local cal = sbar.add("item", {
	icon = "",
	label = {
		align = "center",
	},
	position = "right",
	update_freq = 15,
})

local function update()
	local date = os.date("%d. %b")
	local time = os.date("%H:%M")
	cal:set({ label = date .. " " .. time })
end

cal:subscribe("routine", update)
cal:subscribe("forced", update)
