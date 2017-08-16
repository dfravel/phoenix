defmodule MessengyrWeb.ChatController do
    use MessengyrWeb, :controller

    plug Guardian.Plug.EnsureAuthenticated, handler: __MODULE__

    def index(conn, _params) do
        render conn
    end

    def unauthenticated(conn, _params) do
        conn
        |> put_flash(:error, "Sorry, you need to login to view your messages")
        |> redirect(to: "/")
    end

end