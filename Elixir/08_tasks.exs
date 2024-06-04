# Using the Task module to parallelize functions
#
# Gilberto Echeverria
# 2024-06-04

defmodule Parallel do

  # Module attributes
  # Can be used as a "global" variable within the module
  @num_threads 5

  # A simple function that will be called on each thread
  def thread_func(id) do
    IO.puts("I am #{id}")
    id * 3
  end

  # Launching a single task
  def main() do
    IO.puts("STARTING MAIN THREAD")
    # Launch a new process to run a function
    task = Task.async(fn -> thread_func("Test") end)
    IO.inspect(task, label: "The task")
    Task.await(task)
    IO.puts("FINISHING MAIN THREAD")
  end

  def multi() do
    IO.puts("STARTING MAIN THREAD")
    t1 = Task.async(fn -> thread_func("T1") end)
    t2 = Task.async(fn -> thread_func("T2") end)
    t3 = Task.async(fn -> thread_func("T3") end)
    Task.await(t1)
    Task.await(t2)
    Task.await(t3)
    IO.puts("FINISHING MAIN THREAD")
  end

  # Launching multiple tasks using the for construction
  def loops() do
    # Loop to create several tasks
    tasks = for n <- 1..@num_threads do
      Task.async(fn -> thread_func(n) end)
    end
    # The result of the for is a list of structures
    IO.inspect(tasks)
    # Iterate over the list of structures to wait for the tasks to finish
    for task <- tasks do
      Task.await(task)
    end
  end

  # Usin pipe operator and Enum.map to reduce the code
  def maps() do
    1..@num_threads
    |> Enum.map(&Task.async(fn -> thread_func(&1) end))
    |> Enum.map(&Task.await(&1))
  end
end
