# zen

declare-option -hidden int cols

define-command -hidden refresh-cols %{
  set-option global cols %sh{tput cols}
}

define-command zen %{
  refresh-cols
  # hook window WinResize .* %{
  #   evaluate-commands refresh-cols
  # }
}
