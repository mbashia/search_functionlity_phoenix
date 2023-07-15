defmodule ProjectWeb.TaskController do
  use ProjectWeb, :controller
  use Rummage.Phoenix.Controller
  alias Project.Repo

  alias Project.Tasks
  alias Project.Tasks.Task

  def index(conn, _params) do
    tasks = Tasks.list_tasks()
    changeset = Tasks.change_task(%Task{})
    IO.inspect(conn.params)

    render(conn, "index.html", tasks: tasks, changeset: changeset)
  end

  def new(conn, _params) do
    changeset = Tasks.change_task(%Task{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"task" => task_params}) do
    case Tasks.create_task(task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task created successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    render(conn, "show.html", task: task)
  end

  def edit(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    changeset = Tasks.change_task(task)
    render(conn, "edit.html", task: task, changeset: changeset)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Tasks.get_task!(id)

    case Tasks.update_task(task, task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task updated successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", task: task, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    {:ok, _task} = Tasks.delete_task(task)

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: Routes.task_path(conn, :index))
  end
   def search(conn, %{"task" => %{"search" => search_params}}) do
    tasks = Tasks.search(search_params)
    changeset = Tasks.change_task(%Task{})
    IO.inspect(tasks)
  case tasks do
  [] ->
  conn
  |> put_flash(:error, "no results")
  |> render( "index.html", tasks: [], changeset: changeset)
  _ ->
  conn

  |> put_flash(:info, "Feed search successfully.")

  |> render( "index.html", tasks: tasks, changeset: changeset)

  end

  end


end
