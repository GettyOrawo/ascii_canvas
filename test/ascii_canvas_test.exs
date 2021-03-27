defmodule AsciiCanvasTest do
  use ExUnit.Case
  doctest AsciiCanvas

  test "gives outline co-ordinates" do
    assert AsciiCanvas.new([3,2],5,3,"@","x") == %{character: "@", 
    												coordinates: [
													  {3, 2},
													  {3, 3},
													  {3, 4},
													  {4, 2},
													  {4, 4},
													  {5, 2},
													  {5, 4},
													  {6, 2},
													  {6, 4},
													  {7, 2},
													  {7, 3},
													  {7, 4}
													]
												 }
  end
end
