defmodule CreateReports.AllHours do
  # alias CreateReports.{Parse}

  def build(filename, list_names) do
    list_names = create_map(list_names)
    # filename is the enumerable
    # list_names is map with keys and values "name" => 0
    # to sum_values we pass the name and hours for each user and add it to the correct key
    Enum.reduce(filename, list_names, fn(line, report) -> sum_values(line, report) end)
  end

  defp sum_values([name, hours, _days, _months, _years], report) do
    # report refers to list_names
    # name is the key of the map "Cleiton" => 0
    Map.put(report,name, report[name] + hours)
  end

  def create_map(list_names) do
    list_names
    |>Enum.into(%{}, &{&1, 0})
  end

end
