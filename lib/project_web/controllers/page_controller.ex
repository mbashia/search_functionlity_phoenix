defmodule ProjectWeb.PageController do
  use ProjectWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
 def confirm(conn,_params)do
  render(conn, "email_prompt.html")
 end

end
