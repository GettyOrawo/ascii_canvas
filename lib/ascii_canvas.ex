defmodule AsciiCanvas do
  @moduledoc """
  Creates a canvas board and fills it with the provided outline and/or fill characters
  """

  defstruct [:origin, :start, :width, :height, :outline, :fill]

  @doc """
  navigator reducer function moves right from current cell
  """
  defp right({x,y}) do
    {x+1, y}
  end

  @doc """
  navigator reducer function moves left from current cell
  """
  defp left({x,y}) do
    {x-1, y}
  end

  @doc """
  navigator reducer function moves down from current cell
  """
  defp down({x,y}) do
    {x, y+1}
  end

  @doc """
  navigator reducer function moves up from current cell
  """
  defp up({x,y}) do
    {x, y-1}
  end
end