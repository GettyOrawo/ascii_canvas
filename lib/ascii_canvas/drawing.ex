defmodule AsciiCanvas.Drawing do
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "drawings" do
    field :coordinates, {:array, :map}
    field :canvas_id, :binary_id
  end
end