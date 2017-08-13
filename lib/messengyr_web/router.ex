defmodule MessengyrWeb.Router do
  use MessengyrWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :browser_session do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MessengyrWeb do
    pipe_through [:browser, :browser_session]

    get "/", PageController, :index

    # leaving the test route in here just because
    get "/test", PageController, :say_hello

    # create new routes for login and landing pages
    get "/signup", PageController, :signup
    get "/login", PageController, :login

    # routes for posts
    post "/signup", PageController, :create_user
    post "/login", PageController, :login_user
  end

  # Other scopes may use custom stacks.
  # scope "/api", MessengyrWeb do
  #   pipe_through :api
  # end
end
