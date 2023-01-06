local web_ok, web = pcall(require, "web-tools")

if not web_ok then
    return
end

local cfg = {
    keymap = {
        rename = nil,
        repeat_rename = ".",
    },
}

web.setup(cfg)
