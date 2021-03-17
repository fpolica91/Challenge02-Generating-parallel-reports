defmodule CreateReports do
  alias CreateReports.{Parse, AllHours, HoursPerYear, HoursPerMonth}



  def build_from_many(filenames) do
    all_hours  = %{
      "Cleiton" => 0,
      "Daniele" => 0,
      "Danilo" => 0,
      "Diego" => 0,
      "Giuliano" => 0,
      "Jakeliny" => 0,
      "Joseph" => 0,
      "Mayk" => 0,
      "Rafael" => 0,
      "Vinicius" => 0
    }

    hours_per_year =  %{
      "Cleiton" => %{
        "2016" => 0,
        "2017" => 0,
        "2018" => 0,
        "2019" => 0,
        "2020" => 0
      },
      "Daniele" => %{
        "2016" => 0,
        "2017" => 0,
        "2018" => 0,
        "2019" => 0,
        "2020" => 0
      },
      "Danilo" => %{
        "2016" => 0,
        "2017" => 0,
        "2018" => 0,
        "2019" => 0,
        "2020" => 0
        },
      "Diego" => %{
        "2016" => 0,
        "2017" => 0,
        "2018" => 0,
        "2019" => 0,
        "2020" => 0
      },
      "Giuliano" => %{
        "2016" => 0,
        "2017" => 0,
        "2018" => 0,
        "2019" => 04,
        "2020" => 0
      },
      "Jakeliny" => %{
        "2016" => 0,
        "2017" => 0,
        "2018" => 0,
        "2019" => 0,
        "2020" => 0
      },
      "Joseph" => %{
        "2016" => 0,
        "2017" => 0,
        "2018" => 0,
        "2019" => 0,
        "2020" => 0
      },
      "Mayk" => %{
        "2016" => 0,
        "2017" => 0,
        "2018" => 0,
        "2019" => 0,
        "2020" => 0
      },
      "Rafael" => %{
        "2016" => 0,
        "2017" => 0,
        "2018" => 0,
        "2019" => 0,
        "2020" => 0
      },
      "Vinicius" => %{
        "2016" => 0,
        "2017" => 0,
        "2018" => 0,
        "2019" => 0,
        "2020" => 0
      }
    }


    hours_per_month = %{
      "Cleiton" => %{
        "April" => 0,
        "August" => 0,
        "December" => 0,
        "Feb" => 0,
        "Jan" => 0,
        "July" => 0,
        "June" => 0,
        "March" => 0,
        "May" => 0,
        "November" => 0,
        "October" => 0,
        "September" => 0
      },
      "Daniele" => %{
        "April" => 0,
        "August" => 0,
        "December" => 0,
        "Feb" => 0,
        "Jan" => 0,
        "July" => 0,
        "June" => 0,
        "March" => 0,
        "May" => 0,
        "November" => 0,
        "October" => 0,
        "September" => 0
      },
      "Danilo" => %{
        "April" => 0,
        "August" => 0,
        "December" => 0,
        "Feb" => 0,
        "Jan" => 0,
        "July" => 0,
        "June" => 0,
        "March" => 0,
        "May" => 0,
        "November" => 0,
        "October" => 0,
        "September" => 0
      },
      "Diego" => %{
        "April" => 0,
        "August" => 0,
        "December" => 0,
        "Feb" => 0,
        "Jan" => 0,
        "July" => 0,
        "June" => 0,
        "March" => 0,
        "May" => 0,
        "November" => 0,
        "October" => 0,
        "September" => 0
      },
      "Giuliano" => %{
        "April" => 0,
        "August" => 0,
        "December" => 0,
        "Feb" => 0,
        "Jan" => 0,
        "July" => 0,
        "June" => 0,
        "March" => 0,
        "May" => 0,
        "November" => 0,
        "October" => 0,
        "September" => 0
      },
      "Jakeliny" => %{
        "April" => 0,
        "August" => 0,
        "December" => 0,
        "Feb" => 0,
        "Jan" => 0,
        "July" => 0,
        "June" => 0,
        "March" => 0,
        "May" => 0,
        "November" => 0,
        "October" => 0,
        "September" => 0
      },
      "Joseph" => %{
        "April" => 0,
        "August" => 0,
        "December" => 0,
        "Feb" => 0,
        "Jan" => 0,
        "July" =>0,
        "June" => 0,
        "March" => 0,
        "May" => 0,
        "November" => 0,
        "October" => 0,
        "September" => 0
      },
      "Mayk" => %{
        "April" => 0,
        "August" => 0,
        "December" => 0,
        "Feb" => 0,
        "Jan" => 0,
        "July" => 0,
        "June" => 0,
        "March" => 0,
        "May" => 0,
        "November" => 0,
        "October" => 0,
        "September" => 0
      },
      "Rafael" => %{
        "April" => 0,
        "August" => 0,
        "December" => 0,
        "Feb" => 0,
        "Jan" => 0,
        "July" => 0,
        "June" => 0,
        "March" => 0,
        "May" => 0,
        "November" => 0,
        "October" => 0,
        "September" => 0
      },
      "Vinicius" => %{
        "April" => 0,
        "August" => 0,
        "December" => 0,
        "Feb" => 0,
        "Jan" => 0,
        "July" => 0,
        "June" => 0,
        "March" => 0,
        "May" => 0,
        "November" => 0,
        "October" => 0,
        "September" => 0
      }
    }

    report = %{
      all_hours: all_hours,
      hours_per_month: hours_per_month,
      hours_per_year:  hours_per_year
    }




    filenames
    |>Task.async_stream(fn filename -> build(filename) end)
    |>Enum.reduce(report, fn{:ok ,result}, report ->
      sum_values(report, result)
    end)
  end


  defp sum_values(
    %{all_hours: all_hours,   hours_per_month: hours_per_month, hours_per_year: hours_per_year },
    %{all_hours: all_hours2,  hours_per_month: hours_per_month2, hours_per_year: hours_per_year2 }

  ) do
    all_hours = Map.merge(all_hours, all_hours2, fn _name, value1, value2 -> value1 + value2 end)
    hours_per_month = Map.merge(hours_per_month, hours_per_month2, fn  _key,v1, v2 -> Map.merge(v1, v2, fn(_month, a, b) -> a + b end) end)
    hours_per_year = Map.merge(hours_per_year, hours_per_year2, fn  _key,v1, v2 -> Map.merge(v1, v2, fn(_month, a, b) -> a + b end) end)
    %{
      all_hours:  all_hours,
      hours_per_month:  hours_per_month,
      hours_per_year: hours_per_year
    }

  end

  def build(filename) do
   parsed_file =  filename
    |>Parse.build()
    list_names = generate_list_names(parsed_file)
    all_hours =
    parsed_file
    |>AllHours.build(list_names)

    hours_per_year = HoursPerYear.build(parsed_file, list_names)

    hours_per_month = HoursPerMonth.build(parsed_file, list_names)

    %{
      all_hours: all_hours,
      hours_per_month: hours_per_month,
      hours_per_year: hours_per_year,
    }

  end


  def generate_list_names(list) do
    Enum.map(list, fn [head | _tail] -> head end)
    |>Enum.uniq()
  end

  def hello do
    :world
  end
end
