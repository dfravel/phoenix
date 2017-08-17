defmodule MessengyrWeb.UserController do
    use MessengyrWeb, :controller

    alias Messengyr.Accounts

    def show(conn, %{"id" => user_id})  do
        user = Accounts.get_user(user_id)

        render(conn, "show.json", user: user)
    end
end