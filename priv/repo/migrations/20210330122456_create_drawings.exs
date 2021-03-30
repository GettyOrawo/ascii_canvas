defmodule AsciiCanvas.Repo.Migrations.CreateDrawings do
  use Ecto.Migration

  def change do
  	create table(:drawings) do
      add :coordinates, {:array, :map}
      add :canvas_id, references(:canvas, on_delete: :delete_all)
    end
  end
end
