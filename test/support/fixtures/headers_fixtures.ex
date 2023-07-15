defmodule Project.HeadersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Project.Headers` context.
  """

  @doc """
  Generate a header.
  """
  def header_fixture(attrs \\ %{}) do
    {:ok, header} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> Project.Headers.create_header()

    header
  end
end
