defmodule AsciiCanvasTest do
  use ExUnit.Case
  doctest AsciiCanvas

  test "greets the world" do
    assert AsciiCanvas.hello() == :world
  end
end
