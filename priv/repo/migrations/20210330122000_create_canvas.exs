defmodule AsciiCanvas.Repo.Migrations.CreateCanvas do
  use Ecto.Migration

  def change do
  	create table(:canvas) do
      add :width, :integer
      add :height, :integer
      add :origin, {:array, :integer}
    end
  end
end
