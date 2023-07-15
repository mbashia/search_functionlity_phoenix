defmodule Project.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Project.Tasks` context.
  """

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{
        body: "some body",
        title: "some title"
      })
      |> Project.Tasks.create_task()

    task
  end
end
