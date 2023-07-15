defmodule Project.Repo.Migrations.CreateHeaders do
  use Ecto.Migration

  def change do
    create table(:headers) do
      add :title, :string
      add :body, :text

      timestamps()
    end
  end
end
