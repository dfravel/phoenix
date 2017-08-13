defmodule MessengyrWeb.PageController do
  use MessengyrWeb, :controller

  def index(conn, _params) do
    render conn
  end

  #  leaving this one in here as an earlier example
  def say_hello(conn, _params) do
    text conn, "Hello!"
  end

  def login(conn, _params) do
      render conn
  end

  def signup(conn, _params) do
      render conn
  end
end
