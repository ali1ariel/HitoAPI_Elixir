Bureaucrat.start(
  writer: Bureaucrat.MarkdownWriter,
  default_path: "API_README.html.md",
  swagger: "priv/static/swagger.json" |> File.read!() |> Poison.decode!(),
  paths: [],
  titles: [],
  env_var: "DOC",
  json_library: Poison
)
ExUnit.start(formatters: [ExUnit.CLIFormatter, Bureaucrat.Formatter])
