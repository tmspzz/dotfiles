#!/usr/bin/env bash
# tmux quick-help cheat sheet, shown in a popup via `prefix + ?`.

BLUE=$'\e[1;38;2;88;166;255m'    # bold #58a6ff  (headings)
KEY=$'\e[1;38;2;201;209;217m'    # bold #c9d1d9  (keys)
DIM=$'\e[38;2;125;151;184m'      # #7d97b8       (notes)
R=$'\e[0m'

printf '\n'
printf '  %stmux quick help%s     %sprefix = Ctrl-a%s\n' "$BLUE" "$R" "$DIM" "$R"
printf '  %spress Ctrl-a, release, then the key.%s\n\n' "$DIM" "$R"

printf '  %sWindows%s\n' "$BLUE" "$R"
printf '    %sc%s   new window        %s,%s   rename\n' "$KEY" "$R" "$KEY" "$R"
printf '    %s&%s   kill window       %sn/p%s next / prev\n' "$KEY" "$R" "$KEY" "$R"
printf '    %s1-9%s go to window N\n\n' "$KEY" "$R"

printf '  %sPanes (splits)%s\n' "$BLUE" "$R"
printf '    %s|%s   split left/right  %s-%s   split top/bottom\n' "$KEY" "$R" "$KEY" "$R"
printf '    %sx%s   kill pane         %sz%s   zoom / unzoom\n' "$KEY" "$R" "$KEY" "$R"
printf '    %sCtrl-h/j/k/l%s  move between panes (no prefix)\n\n' "$KEY" "$R"

printf '  %sSession%s\n' "$BLUE" "$R"
printf '    %sd%s   detach (leave tmux; keeps running)\n' "$KEY" "$R"
printf '    %sr%s   reload config     %s?%s   this help\n\n' "$KEY" "$R" "$KEY" "$R"

printf '  %sNeovim -> Claude%s   %s(keys inside Neovim, Space = leader)%s\n' "$BLUE" "$R" "$DIM" "$R"
printf '    %sin Claude pane:%s %s/ide%s   connect to Neovim (once)\n' "$DIM" "$R" "$KEY" "$R"
printf '    %sSpace a s%s  send visual selection to Claude\n' "$KEY" "$R"
printf '    %sSpace a b%s  add current file    %sSpace a ?%s status\n' "$KEY" "$R" "$KEY" "$R"
printf '    %sSpace a a%s / %sSpace a d%s  accept / deny a Claude diff\n\n' "$KEY" "$R" "$KEY" "$R"

printf '  %spress any key to close%s\n' "$DIM" "$R"

read -rsn1 _
