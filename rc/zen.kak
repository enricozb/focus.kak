# zen

declare-option -hidden line-specs zen_padding

define-command -hidden refresh-indent %{
  set-option global zen_padding %val{timestamp} %sh{
    padding=$(echo "($(tput cols) - 80) / 2" | bc)
    printf "0|"; printf "%${padding}s" 
  }
}

define-command zen %{
  remove-highlighter global/number-lines
  remove-highlighter global/show-whitespaces

  add-highlighter -override buffer/ flag-lines default zen_padding
  add-highlighter -override buffer/ wrap -word -width 80

  set-option buffer modelinefmt ''
  set-option -add global ui_options "ncurses_padding_char= "

  refresh-indent
  hook window WinResize .* %{
    evaluate-commands refresh-indent
  }
}
