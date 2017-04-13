defmodule UmbrellaApi.Router do
  use UmbrellaApi.Web, :router

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

  scope "/internal", UmbrellaApi.Internal do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/", UmbrellaApi.External do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", UmbrellaApi do
  #   pipe_through :api
  # end
end
