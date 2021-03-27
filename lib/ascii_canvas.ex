defmodule AsciiCanvas do
  @moduledoc """
  Creates a canvas board and fills it with the provided outline and/or fill characters
  """

  defstruct [:origin, :start, :width, :height, :outline, :fill]

  @doc """
  constructor function: create struct
  """
  def new([x,y], w, h, outline, fill) do

    strct = %__MODULE__{ origin: {x,y}, width: w, height: h, outline: outline, fill: fill }
    draw_outline([], strct, 0, {x,y})

  end

  @doc """
  fetches all the coordinates for an outline, if one is provided
  """

  def draw_outline(coordinates, strct, acc, org) when acc < strct.width-1 do
      curr = org |> right
      coordinates
      |> List.insert_at(0, curr)
      |> draw_outline(strct, acc+1, curr)
  end

  def draw_outline(coordinates, strct, acc, org) when acc < (strct.width + strct.height)-2 do
      curr = org |> down
      coordinates
      |> List.insert_at(0, curr)
      |> draw_outline(strct, acc+1, curr)
  end

  def draw_outline(coordinates, strct, acc, org) when acc < (strct.width + strct.height + strct.width)-3 do
      curr = org |> left
      coordinates
      |> List.insert_at(0, curr)
      |> draw_outline(strct, acc+1, curr)
  end

  def draw_outline(coordinates, strct, acc, org) when acc < (strct.width + strct.height + strct.width + strct.height)-4 do
      curr = org |> up
      coordinates
      |> List.insert_at(0, curr)
      |> draw_outline(strct, acc+1, curr)
  end

  def draw_outline(coordinates, strct, _acc, _org) do
      c = coordinates
      |> Enum.sort()

      %{character: strct.outline, coordinates: c}
  end

  defp right({x,y}) do
    {x+1, y}
  end

  defp left({x,y}) do
    {x-1, y}
  end

  defp down({x,y}) do
    {x, y+1}
  end

  defp up({x,y}) do
    {x, y-1}
  end
end