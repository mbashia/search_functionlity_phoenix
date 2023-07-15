defmodule Project.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string
      add :body, :text

      timestamps()
    end
  end
end
