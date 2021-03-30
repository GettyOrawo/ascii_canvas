defmodule AsciiCanvasTest do
  use ExUnit.Case
  doctest AsciiCanvas

  test "fixture 1: gives outline and fill co-ordinates" do
  	{:ok, x} = AsciiCanvas.new([3,2],5,3,"@","x")
    assert x.coordinates == [
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

  test "fixture 1: gives outline and fill co-ordinates" do
  	{:ok, x} = AsciiCanvas.new([10,3],14,6,"x","o")
    assert x.coordinates == [
						     %{char: "x", x: 10, y: 3},
						     %{char: "x", x: 10, y: 4},
						     %{char: "x", x: 10, y: 5},
						     %{char: "x", x: 10, y: 6},
						     %{char: "x", x: 10, y: 7},
						     %{char: "x", x: 10, y: 8},
						     %{char: "x", x: 11, y: 3},
						     %{char: "x", x: 11, y: 8},
						     %{char: "x", x: 12, y: 3},
						     %{char: "x", x: 12, y: 8},
						     %{char: "x", x: 13, y: 3},
						     %{char: "x", x: 13, y: 8},
						     %{char: "x", x: 14, y: 3},
						     %{char: "x", x: 14, y: 8},
						     %{char: "x", x: 15, y: 3},
						     %{char: "x", x: 15, y: 8},
						     %{char: "x", x: 16, y: 3},
						     %{char: "x", x: 16, y: 8},
						     %{char: "x", x: 17, y: 3},
						     %{char: "x", x: 17, y: 8},
						     %{char: "x", x: 18, y: 3},
						     %{char: "x", x: 18, y: 8},
						     %{char: "x", x: 19, y: 3},
						     %{char: "x", x: 19, y: 8},
						     %{char: "x", x: 20, y: 3},
						     %{char: "x", x: 20, y: 8},
						     %{char: "x", x: 21, y: 3},
						     %{char: "x", x: 21, y: 8},
						     %{char: "x", x: 22, y: 3},
						     %{char: "x", x: 22, y: 8},
						     %{char: "x", x: 23, y: 3},
						     %{char: "x", x: 23, y: 4},
						     %{char: "x", x: 23, y: 5},
						     %{char: "x", x: 23, y: 6},
						     %{char: "x", x: 23, y: 7},
						     %{char: "x", x: 23, y: 8},
						     %{char: "o", x: 11, y: 4},
						     %{char: "o", x: 11, y: 5},
						     %{char: "o", x: 11, y: 6},
						     %{char: "o", x: 11, y: 7},
						     %{char: "o", x: 12, y: 4},
						     %{char: "o", x: 12, y: 5},
						     %{char: "o", x: 12, y: 6},
						     %{char: "o", x: 12, y: 7},
						     %{char: "o", x: 13, y: 4},
						     %{char: "o", x: 13, y: 5},
						     %{char: "o", x: 13, y: 6},
						     %{char: "o", x: 13, y: 7},
						     %{char: "o", x: 14, y: 4},
						     %{char: "o", x: 14, y: 5},
						     %{char: "o", x: 14, y: 6},
						     %{char: "o", x: 14, y: 7},
						     %{char: "o", x: 15, y: 4},
						     %{char: "o", x: 15, y: 5},
						     %{char: "o", x: 15, y: 6},
						     %{char: "o", x: 15, y: 7},
						     %{char: "o", x: 16, y: 4},
						     %{char: "o", x: 16, y: 5},
						     %{char: "o", x: 16, y: 6},
						     %{char: "o", x: 16, y: 7},
						     %{char: "o", x: 17, y: 4},
						     %{char: "o", x: 17, y: 5},
						     %{char: "o", x: 17, y: 6},
						     %{char: "o", x: 17, y: 7},
						     %{char: "o", x: 18, y: 4},
						     %{char: "o", x: 18, y: 5},
						     %{char: "o", x: 18, y: 6},
						     %{char: "o", x: 18, y: 7},
						     %{char: "o", x: 19, y: 4},
						     %{char: "o", x: 19, y: 5},
						     %{char: "o", x: 19, y: 6},
						     %{char: "o", x: 19, y: 7}, 
						     %{char: "o", x: 20, y: 4},
						     %{char: "o", x: 20, y: 5},
						     %{char: "o", x: 20, y: 6},
						     %{char: "o", x: 20, y: 7},
						     %{char: "o", x: 21, y: 4},
						     %{char: "o", x: 21, y: 5},
						     %{char: "o", x: 21, y: 6},
						     %{char: "o", x: 21, y: 7},
						     %{char: "o", x: 22, y: 4},
						     %{char: "o", x: 22, y: 5},
						     %{char: "o", x: 22, y: 6},
						     %{char: "o", x: 22, y: 7}
						   ]
  end

  test "fixture 2: gives fill only co-ordinates" do
  	{:ok, x} = AsciiCanvas.new([14,0],7,6,nil,".")
    assert x.coordinates == [
						     %{char: ".", x: 15, y: 1},
						     %{char: ".", x: 15, y: 2},
						     %{char: ".", x: 15, y: 3},
						     %{char: ".", x: 15, y: 4},
						     %{char: ".", x: 16, y: 1},
						     %{char: ".", x: 16, y: 2},
						     %{char: ".", x: 16, y: 3},
						     %{char: ".", x: 16, y: 4},
						     %{char: ".", x: 17, y: 1},
						     %{char: ".", x: 17, y: 2},
						     %{char: ".", x: 17, y: 3},
						     %{char: ".", x: 17, y: 4},
						     %{char: ".", x: 18, y: 1},
						     %{char: ".", x: 18, y: 2},
						     %{char: ".", x: 18, y: 3},
						     %{char: ".", x: 18, y: 4},
						     %{char: ".", x: 19, y: 1},
						     %{char: ".", x: 19, y: 2},
						     %{char: ".", x: 19, y: 3},
						     %{char: ".", x: 19, y: 4}
						   ]
  end

  test "fixture 2: gives fill only co-ordinates when fill and outline characters are same" do
  	{:ok, x} = AsciiCanvas.new([5,5],5,3,"x","x")
    assert x.coordinates == [
						     %{char: "x", x: 5, y: 5},
						     %{char: "x", x: 5, y: 6},
						     %{char: "x", x: 5, y: 7},
						     %{char: "x", x: 6, y: 5},
						     %{char: "x", x: 6, y: 7},
						     %{char: "x", x: 7, y: 5},
						     %{char: "x", x: 7, y: 7},
						     %{char: "x", x: 8, y: 5},
						     %{char: "x", x: 8, y: 7},
						     %{char: "x", x: 9, y: 5},
						     %{char: "x", x: 9, y: 6},
						     %{char: "x", x: 9, y: 7},
						     %{char: "x", x: 6, y: 6},
						     %{char: "x", x: 7, y: 6},
						     %{char: "x", x: 8, y: 6}
						   ]
  end
end
