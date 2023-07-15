defmodule Project.Headers.Header do
  use Ecto.Schema
  import Ecto.Changeset

  schema "headers" do
    field :body, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(header, attrs) do
    header
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
