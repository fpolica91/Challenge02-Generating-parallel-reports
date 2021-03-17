defmodule CreateReports.HoursPerYear do
  # alias CreateReports.{Parse}

  def build(parsed_file, list_of_names) do
    # list_names is what you see below, an array the names of the employees
    # ["Daniele", "Mayk", "Giuliano", "Cleiton", "Jakeliny", "Joseph", "Diego",
    # "Danilo", "Rafael", "Vinicius"]
    # Similarly we need a list of years each one of them worked. ["2016", "2017","2018"]
    # with the above we need to construct something like this
    # danilo: %{
      #         2016: 276,
      #         2017: 412,
      #         ...
      #     },
    list_of_years =
      parsed_file
    |>generate_list_of_years()

    list_of_names_with_years =
      create_users_with_years_map(list_of_names, list_of_years)

      parsed_file
      |>Enum.reduce(list_of_names_with_years, fn(line, report) -> sum_values(line, report) end)

  end

  defp generate_list_of_years(parsed_file) do
    parsed_file
    |>Enum.map(fn[_name, _hours, _days, _months, years] -> years end)
    |>Enum.uniq()
  end

  defp sum_values([name, hours, _day, _month, year], %{} = report ) do
    list = Map.put(report[name], year, report[name][year] + hours)
    # Map.put(report, name, list)
    %{report | name => list}
  end


  defp create_users_with_years_map(list_of_names, list_of_years) do
    list_of_names
    |>Enum.into(%{}, fn(name) -> {name,  create_inner_map(list_of_years)} end)
  end

  defp create_inner_map(list) do
    list |> Enum.into(%{}, fn(year) -> {year, 0} end)
  end

end
