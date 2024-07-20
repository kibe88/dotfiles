return {
  formatCommand = "rubocop -A -f quiet --stderr -s ${INPUT}",
  formatStdin = true,
  lintCommand = "rubocop --format emacs --force-exclusion --stdin ${INPUT}"
}
