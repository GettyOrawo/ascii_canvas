defmodule AsciiCanvas do
  @moduledoc """
  Creates a canvas board and fills it with the provided outline and/or fill characters
  """
  import Ecto.Query
  alias AsciiCanvas.Canva
  alias AsciiCanvas.Drawing
  alias AsciiCanvas.Repo

  defstruct [:origin, :width, :height, :outline, :fill, :canvas_id]

  @doc """
  constructor: creates initial state and draws a rectangle
  """

   def launch_canvas do
    Canva |> Repo.one()  |> launch_canvas()      
   end

   def launch_canvas(%Canva{} = canva) do
    canva
    |> Repo.delete()
    launch_canvas(nil)
   end

   def launch_canvas(nil) do
      Repo.insert(%Canva{width: 10, height: 10, origin: %{x: 0, y: 0}})
   end

  
  def new([x,y], w, h, outline, fill) do
    canvas = Repo.one(Canva)
    %__MODULE__{ origin: {x,y}, width: w, height: h, outline: outline, fill: fill, canvas_id: canvas.id}
    |> draw()
  end

  def new([x,y], fill) do
    canvas = Repo.one(Canva)
    strct = %__MODULE__{ origin: {x,y}, width: (canvas.width+1)-x, height: (canvas.height+1)-y, fill: fill, canvas_id: canvas.id}
    draw({:flood_fill, strct})
  end

  @doc """
  fetches all the outline coordinates for a given rectangle, if outline is specified
  """
  def draw({:flood_fill, strct}) do
    coords = strct
    |> draw_fill()
    |> ignore_existing_coordinates()
    |> Enum.sort()

    Repo.insert(%Drawing{coordinates: coords, canvas_id: strct.canvas_id})
  end

  def ignore_existing_coordinates(coords) do
    # all_active_coordinates()
    coords -- duplicate_coordinates(coords)
  end

  def  duplicate_coordinates(coords) do
    atom_key_coords = 
      all_active_coordinates()
      |> Enum.map(fn string_key_map -> 
           for {key, val} <- string_key_map, into: %{}, do: {String.to_atom(key), val}  end
          )
    Enum.map(atom_key_coords, 
      fn g -> 
        Enum.filter(coords, 
          fn h -> 
            Map.equal?(Map.take(g, [:x,:y]), Map.take(h, [:x, :y]))
          end
        ) 
      end
    ) 
    |> List.flatten()
  end

  def all_active_coordinates do
     query = from p in AsciiCanvas.Drawing,
     select: p.coordinates

    query
    |> AsciiCanvas.Repo.all() 
    |> List.flatten()
    |> Enum.uniq()
  end

  def draw(strct) when strct.outline == nil do
    coords = strct
    |> draw_fill()
    |> Enum.sort

    Repo.insert(%Drawing{coordinates: coords, canvas_id: strct.canvas_id})
  end

  def draw(strct) when strct.outline == strct.fill do
    coords = strct
    |> draw_fill()
    |> Enum.sort

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
      |> List.insert_at(0,%{x: x, y: y, char: strct.outline})
      |> draw_outline(strct, acc+1, move_up(org))
  end

  def draw_outline(coordinates, _strct, _acc, _org) do
      coordinates
      |> Enum.sort()
  end

  def draw_outline_and_fill(strct) do
    {x,y} = strct.origin
    strc = %__MODULE__{origin: {x+1, y+1}, width: strct.width-2, height: strct.height-2, canvas_id: strct.canvas_id, fill: strct.fill}
    draw_outline([], strct, 0, strct.origin)
    |> Enum.concat(draw_fill(strc))
    |> Enum.sort()
  end

  @doc """
  fetches all the fill coordinates for a given rectangle, if outline is 'none'
  """
  def draw_fill(strct) do
    {x,y} = strct.origin
    x_coordinates = Enum.to_list(x..x+(strct.width)-1)
    y_coordinates = Enum.to_list(y..y+(strct.height)-1)
    for n <- x_coordinates, t <- y_coordinates do
      %{x: n, y: t, char: strct.fill}
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