defmodule AsciiCanvas do
  @moduledoc """
  Creates a canvas board and fills it with the provided outline and/or fill characters
  """
  alias AsciiCanvas.Canva
  alias AsciiCanvas.Drawing
  alias AsciiCanvas.Repo

  defstruct [:origin, :start, :width, :height, :outline, :fill, :canvas_id]

  @doc """
  constructor: creates initial state and draws a rectangle
  """
  
  def new([x,y], w, h, outline, fill) do
    {:ok, canvas} = Repo.insert(%Canva{width: 100, height: 100, origin: %{x: 0, y: 0}})
    %__MODULE__{ origin: {x,y}, width: w, height: h, outline: outline, fill: fill, canvas_id: canvas.id }
    |> draw()
  end

  def new([x,y], fill) do
    
  end

  @doc """
  fetches all the outline coordinates for a given rectangle, if outline is specified
  """

  def draw(strct) when strct.outline == nil || strct.outline == strct.fill do
    coords = strct
    |> draw_fill()

    Repo.insert(%Drawing{coordinates: coords, canvas_id: strct.canvas_id})
  end

  def draw(strct) when strct.fill == nil do
    coords = []
    |> draw_outline(strct, 0, strct.origin)

    Repo.insert(%Drawing{coordinates: coords, canvas_id: strct.canvas_id})
  end

  def draw(strct) do
    coords = draw_outline_and_fill(strct)
    Repo.insert(%Drawing{coordinates: coords, canvas_id: strct.canvas_id})
  end

  @doc """
  fetches all the outline and fill coordinates for a given rectangle, if outline is specified
  """
  def draw_outline(coordinates, strct, acc, {x,y} = org) when acc < strct.width-1 do
      coordinates
      |> List.insert_at(0, %{x: x, y: y, char: strct.outline})
      |> draw_outline(strct, acc+1, move_right(org))
  end

  def draw_outline(coordinates, strct, acc, {x,y} = org) when acc < (strct.width + strct.height)-2 do
      coordinates
      |> List.insert_at(0, %{x: x, y: y, char: strct.outline})
      |> draw_outline(strct, acc+1, move_down(org))
  end

  def draw_outline(coordinates, strct, acc, {x,y} = org) when acc < (strct.width + strct.height + strct.width)-3 do
      coordinates
      |> List.insert_at(0, %{x: x, y: y, char: strct.outline})
      |> draw_outline(strct, acc+1, move_left(org))
  end

  def draw_outline(coordinates, strct, acc, {x,y} = org) when acc < (strct.width + strct.height + strct.width + strct.height)-4 do
      coordinates
      |> List.insert_at(0, %{x: x, y: y, char: strct.outline})
      |> draw_outline(strct, acc+1, move_up(org))
  end

  def draw_outline(coordinates, strct, _acc, _org) do
      c = coordinates
      |> Enum.sort()
  end

  def draw_outline_and_fill(strct) do
    draw_outline([], strct, 0, strct.origin)
    |> Enum.concat(draw_fill(strct))
  end

  @doc """
  fetches all the fill coordinates for a given rectangle, if outline is 'none'
  """
  def draw_fill(strct) do
    {x,y} = strct.origin
    x_coordinates = Enum.to_list(x+1..x+(strct.width-2))
    y_coordinates = Enum.to_list(y+1..y+(strct.height-2))
    c = for n <- x_coordinates, t <- y_coordinates do
      %{x: n,y: t, char: strct.fill}
    end
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