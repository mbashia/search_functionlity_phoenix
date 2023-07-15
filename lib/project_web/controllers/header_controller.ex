defmodule ProjectWeb.HeaderController do
  use ProjectWeb, :controller

  alias Project.Headers
  alias Project.Headers.Header
  alias Project.Repo

  def index(conn, _params) do
    headers = Headers.list_headers()
    changeset = Headers.change_header(%Header{})
    render(conn, "index.html", headers: headers, changeset: changeset)
  end

  def new(conn, _params) do
    changeset = Headers.change_header(%Header{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"header" => header_params}) do
    case Headers.create_header(header_params) do
      {:ok, header} ->
        conn
        |> put_flash(:info, "Header created successfully.")
        |> redirect(to: Routes.header_path(conn, :show, header))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    header = Headers.get_header!(id)
    render(conn, "show.html", header: header)
  end

  def edit(conn, %{"id" => id}) do
    header = Headers.get_header!(id)
    changeset = Headers.change_header(header)
    render(conn, "edit.html", header: header, changeset: changeset)
  end

  def update(conn, %{"id" => id, "header" => header_params}) do
    header = Headers.get_header!(id)

    case Headers.update_header(header, header_params) do
      {:ok, header} ->
        conn
        |> put_flash(:info, "Header updated successfully.")
        |> redirect(to: Routes.header_path(conn, :show, header))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", header: header, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    header = Headers.get_header!(id)
    {:ok, _header} = Headers.delete_header(header)

    conn
    |> put_flash(:info, "Header deleted successfully.")
    |> redirect(to: Routes.header_path(conn, :index))
  end
  def search(conn, %{"header" => %{"search" => search_params}}) do
    headers = Headers.search(search_params)
    changeset = Headers.change_header(%Header{})
  case headers do
  [] ->
  conn
  |> put_flash(:error, "no results")
  |> render( "index.html", headers: [], changeset: changeset)
  _ ->
  conn

  |> put_flash(:info, "headers search successfully.")

  |> render( "index.html", headers: headers, changeset: changeset)

  end

  end

end
