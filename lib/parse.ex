defmodule CreateReports.Parse do

  def build(filename) do
  "reports/#{filename}"
  |>File.stream!()
  |>Stream.map(fn(line) -> parse_line(line) end)
  end

  defp parse_line(line) do
    line
    |>String.trim()
    |>String.split(",")
    |>List.update_at(1, fn(element) -> String.to_integer(element)end)
  end
end
