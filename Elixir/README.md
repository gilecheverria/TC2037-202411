# Elixir
Programs to learn Elixir

## Language references
- https://elixir-lang.org/getting-started/introduction.html
- https://joyofelixir.com/toc.html
- https://learnxinyminutes.com/docs/elixir/
- https://stackoverflow.com/questions/50496783/extract-the-second-element-of-a-tuple-in-a-pipeline
- https://subscription.packtpub.com/book/application-development/9781788472678/1/ch01lvl1sec14/functions-and-modules
- https://pragprog.com/titles/jgotp/designing-elixir-systems-with-otp/
- https://serokell.io/blog/learn-elixir
- Twitter clone in 15 minutes: https://www.youtube.com/watch?v=MZvmYaFkNJI

### fn vs def
- Syntax for calling lambdas: https://stackoverflow.com/questions/18011784/why-are-there-two-kinds-of-functions-in-elixir?rq=1

### The `for` statement
- https://hashrocket.com/blog/posts/elixir-for-loops-go-beyond-comprehension

### Graphics libraries
- Turtle wrapper: https://github.com/milmazz/turtle
- Example: https://medium.com/@giandr/elixir-scenic-snake-game-b8616b1d7ee0
    ```
    sudo apt-get install pkgconf libglfw3 libglfw3-dev libglewmx1.13 libglew-dev
    ```

### Other libraries
- Generation of QR codes: https://github.com/SiliconJungles/eqrcode
- Image manipulation: https://github.com/elixir-image/image
- Image manipulation: https://github.com/tyre/imagineer (not updated)
- Image processing (ImageMagick): https://hexdocs.pm/mogrify/readme.html
- Phoenix: https://serokell.io/blog/introduction-to-phoenix
- LiveView: https://elixirschool.com/blog/phoenix-live-view/
- Command line applications: https://medium.com/blackode/writing-the-command-line-application-in-elixir-78a8d1b1850


### Style guide
- https://github.com/christopheradams/elixir_style_guide

## Runing examples
There are multiple ways to run Elixir programs
1. Save the files as .exs, then run with a command like:
```bash
elixir example.exs
```
2. Save files as .exs, then enter interactive mode with the file:
```bash
iex example.exs
```
then call the functions. To reload the file, use the `c` function:
```elixir
iex> c("example.exs")
```

## Defining functions
**Lambda functions:**
```elixir
greet = fn (name) -> IO.puts "Hello #{name}!" end
```

Capture notation, where arguments are refered to as `&n`
```elixir
greet = &(IO.puts "Hello #{&1}!")
```

To call lambda functions, use a dot:
```elixir
greet.("Gil")
```

**Named functions:**
Must go inside modules:
```elixir
defmodule Multiply do
  def mult(_, 0), do: 0
  def mult(a, b), do: a + mult(a, b - 1)
end
```

Called with the module name:
```elixir
Multiply.mult(6, 2)
```

## Tracing function calls

### Using the dbg package

Follow the instructions at:
- https://stackoverflow.com/questions/50364530/elixir-trace-function-call
- https://kaiwern.com/posts/2020/11/02/debugging-with-tracing-in-elixir/

The steps:
```elixir
:dbg.start
:dbg.tracer
:dbg.p(:all, :c)
:dbg.tpl(Fact, :fact, 1, [{:_, [], [{:return_trace}]}])
:dbg.tpl(Fact, :do_tail_fact, 2, [{:_, [], [{:return_trace}]}])

:dbg.stop_clear
```

### Using the `binding` function
Add inside a function the code:
```elixir
IO.inspect binding()
```

## Testing with mix
Selecting the tests to be executed / skipped
- https://stackoverflow.com/questions/26150146/how-can-i-make-mix-run-only-specific-tests-from-my-suite-of-tests

## Tools to use Elixir
- Add ons for vim: https://bitboxer.de/2016/11/13/vim-for-elixir/
- To keep the command history in **iex**, add this line to .bashrc
```
export ERL_AFLAGS="-kernel shell_history enabled"
```
