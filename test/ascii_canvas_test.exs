defmodule AsciiCanvasTest do
  use ExUnit.Case
  doctest AsciiCanvas

  test "gives outline anf fill co-ordinates" do
    assert AsciiCanvas.new([3,2],5,3,"@","x") == [
													  %{char: "@", x: 3, y: 2},
													  %{char: "@", x: 3, y: 3},
													  %{char: "@", x: 3, y: 4},
													  %{char: "@", x: 4, y: 2},
													  %{char: "@", x: 4, y: 4},
													  %{char: "@", x: 5, y: 2},
													  %{char: "@", x: 5, y: 4},
													  %{char: "@", x: 6, y: 2},
													  %{char: "@", x: 6, y: 4},
													  %{char: "@", x: 7, y: 2},
													  %{char: "@", x: 7, y: 3},
													  %{char: "@", x: 7, y: 4},
													  %{char: "x", x: 4, y: 3},
													  %{char: "x", x: 5, y: 3},
													  %{char: "x", x: 6, y: 3}
													]
  end
end
