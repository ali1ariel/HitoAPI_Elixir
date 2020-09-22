Bureaucrat.start(
  writer: Bureaucrat.MarkdownWriter,
  default_path: "API_README.md",
  paths: [],
  titles: [],
  env_var: "DOC",
  json_library: Poison
)
ExUnit.start(formatters: [ExUnit.CLIFormatter, Bureaucrat.Formatter])
