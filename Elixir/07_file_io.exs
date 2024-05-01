# Reading and writing into files with Elixir
# Also using regular expressions
#
# Gilberto Echeverria
# 2024-04-30

defmodule Tfile do

  def get_emails(in_filename, out_filename) do

    # Prepare the file to write the results
    {:ok, out_fd} = File.open(out_filename, [:write])

    # Start with the filename
    in_filename
    # Open the file to read it line by line
    |> File.stream!()
    # Scan each line to find email addresses
    |> Enum.map(&Regex.scan(~r/\w+@\w+\.\w{2,4}/, &1))
    # Another syntax for the anonymous function to the map
    #|> Enum.map(fn line -> Regex.scan(~r/\w+@\w+\.\w{2,4}/, line) end)
    # Eliminate lines without an email
    |> Enum.filter(&(&1 != []))
    |> IO.inspect()
    # Remove the lists containing the emails
    |> Enum.map(&hd/1)
    |> Enum.map(&hd/1)
    |> IO.inspect()
    # Write each line to the file
    |> Enum.map(&IO.puts(out_fd, &1))

    File.close(out_fd)
  end

end
