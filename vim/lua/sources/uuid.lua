return {
    get_debug_name = function()
        return 'uuid'
    end,
    complete = function(_, _, callback)
        local uuid = generate_uuid()

        callback({
            {
                label = 'uuid',
                insertText = uuid,
                kind = 15, -- cmp.lsp.CompletionItemKind.Snippet
                documentation = 'Generates a UUID',
            }
        })
    end
}
