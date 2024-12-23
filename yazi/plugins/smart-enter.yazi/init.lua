--- @sync entry
return {
	entry = function()
		local h = cx.active.current.hovered

		if h.cha.is_dir then
			local url = tostring(h.url)
			url = string.gsub(url, " ", "\\ ")
			url = string.gsub(url, "&", "\\&")

			ya.manager_emit("shell", {
				orphan = true,
				confirm = true,
				"zoxide add " .. url,
			})
		end
		ya.manager_emit(h and h.cha.is_dir and "enter" or "open", { hovered = true })
	end,
}
