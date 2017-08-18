defmodule TartMarketWeb.Router do
  use TartMarketWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/auth", TartMarketWeb do
    pipe_through :browser

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end

  scope "/", TartMarketWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/aboutus", PageController, :aboutus

    resources "/fb_users", FbUserController
  end

  # Other scopes may use custom stacks.
  # scope "/api", TartMarketWeb do
  #   pipe_through :api
  # end
end
