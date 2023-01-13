local comment = {
    enable = true,
    enable_autocmd = false,
    config = {
        lua        = "-- %s",
        json       = "// %s",
        css        = "/* %s */",
        javascript = { __default = "// %s", __multiline = "/* %s */" },
    },
}

return {
    comment = comment,
}
