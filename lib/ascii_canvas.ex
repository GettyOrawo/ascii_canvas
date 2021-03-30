defmodule AsciiCanvas do
  @moduledoc """
  Creates a canvas board and fills it with the provided outline and/or fill characters
  """

  defstruct [:origin, :start, :width, :height, :outline, :fill]

  @doc """
  constructor: creates initial state and draws a rectangle
  """
  
  def new([x,y], w, h, outline, fill) do
    %__MODULE__{ origin: {x,y}, width: w, height: h, outline: outline, fill: fill }
    |> draw()
  end

  @doc """
  fetches all the outline coordinates for a given rectangle, if outline is specified
  """

  def draw(strct) when strct.outline == nil do
    strct
    |> draw_fill()
    |> Map.put(:outline, nil)
  end

  def draw(strct) when strct.fill == nil do
    []
    |> draw_outline(strct, 0, strct.origin)
    |> Map.put(:fill, nil)
  end

  def draw(strct) do
    draw_outline_and_fill(strct)
  end
  

  @doc """
  fetches all the outline and fill coordinates for a given rectangle, if outline is specified
  """
  def draw_outline(coordinates, strct, acc, org) when acc < strct.width-1 do
      coordinates
      |> List.insert_at(0, org)
      |> draw_outline(strct, acc+1, move_right(org))
  end

  def draw_outline(coordinates, strct, acc, org) when acc < (strct.width + strct.height)-2 do
      coordinates
      |> List.insert_at(0, org)
      |> draw_outline(strct, acc+1, move_down(org))
  end

  def draw_outline(coordinates, strct, acc, org) when acc < (strct.width + strct.height + strct.width)-3 do
      coordinates
      |> List.insert_at(0, org)
      |> draw_outline(strct, acc+1, move_left(org))
  end

  def draw_outline(coordinates, strct, acc, org) when acc < (strct.width + strct.height + strct.width + strct.height)-4 do
      coordinates
      |> List.insert_at(0, org)
      |> draw_outline(strct, acc+1, move_up(org))
  end

  def draw_outline(coordinates, strct, _acc, _org) do
      c = coordinates
      |> Enum.sort()
      %{outline: %{character: strct.outline, coordinates: c}}
  end

  def draw_outline_and_fill(strct) do
    draw_outline([], strct, 0, strct.origin)
    |> Map.merge(draw_fill(strct))
  end

  @doc """
  fetches all the fill coordinates for a given rectangle, if outline is 'none'
  """
  def draw_fill(strct) do
    {x,y} = strct.origin
    x_coordinates = Enum.to_list(x+1..x+(strct.width-2))
    y_coordinates = Enum.to_list(y+1..y+(strct.height-2))
    c = for n <- x_coordinates, t <- y_coordinates do
      {n,t}
    end
    %{fill: %{character: strct.fill, coordinates: c}}
  end

  defp move_right({x,y}) do
    {x+1, y}
  end

  defp move_left({x,y}) do
    {x-1, y}
  end

  defp move_down({x,y}) do
    {x, y+1}
  end

  defp move_up({x,y}) do
    {x, y-1}
  end
end