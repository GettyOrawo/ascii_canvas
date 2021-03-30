defmodule AsciiCanvas.Canva do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "canvas" do
    field :width, :integer
    field :height, :integer
    field :origin, {:array, :integer}
  end
end