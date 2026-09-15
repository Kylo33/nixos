#!/usr/bin/env fish

gh api --jq '.[].name' /repos/neovim/nvim-lspconfig/contents/lsp \
    | string replace -r "\.lua\$" "" \
    | sk --color=bw \
    | wl-copy --trim-newline
