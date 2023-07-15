defmodule Project.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset
  use Rummage.Ecto

  schema "tasks" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
