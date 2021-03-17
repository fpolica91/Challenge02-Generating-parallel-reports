defmodule CreateReports.HoursPerMonth do
  @month_index %{
    "1" => "Jan",
    "2" => "Feb",
    "3" => "March",
    "4" => "April",
    "5" => "May",
    "6" => "June",
    "7" => "July",
    "8" => "August",
    "9" => "September",
    "10" => "October",
    "11" => "November",
    "12" => "December"
  }





  def build(parsed_file, list_of_names) do
    list_of_months = create_month_list(parsed_file)
    map_users_months = create_map_names_months(list_of_names,  list_of_months)
    parsed_file
    |>Enum.reduce(map_users_months, fn(file, report) -> sum_values(file, report) end)
    |>insert_months_name()
    # Enum.reduce(list_of_names_with_years, fn(line, report) -> sum_values(line, report) end)
  end

  defp sum_values([name, hours, _day, month, _year], %{} = report) do
    list =  Map.put(report[name], month, report[name][month] + hours)
    %{report | name => list}
  end

  defp insert_months_name(list) do
    list
    |> Enum.reduce(%{}, fn {name, list_of_months}, completed_list ->
      list_with_names =
        list_of_months
        |> Enum.reduce(%{}, fn {k, v}, acc -> Map.put(acc, @month_index[k], v) end)
          Map.put(completed_list, name, list_with_names)
    end)
  end

  def create_map_names_months(list_names, list_months) do
    list_names
    |>Enum.into(%{}, fn(name) -> {name,  create_inner_map(list_months)} end)
  end

  def create_inner_map(list) do
    list |> Enum.into(%{}, fn(month) -> {month, 0} end)
  end


  def create_month_list(list) do
    list
    |>Enum.map(fn[_name, _hours,_days, months, _years] -> months end)
    |>Enum.uniq()
  end
end
