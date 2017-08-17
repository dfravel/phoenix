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


    # login and signup routes
    get "/signup", PageController, :signup
    get "/login", PageController, :login
    get "/logout", PageController, :logout

    # routes for posts
    post "/signup", PageController, :create_user
    post "/login", PageController, :login_user

    #only available for logged in users
    get "/messages", ChatController, :index

  end

  # Other scopes may use custom stacks.
  scope "/api", MessengyrWeb do
    pipe_through :api

    resources "/users", UserController, only: [:show]
  end
end
