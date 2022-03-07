defmodule Lv1862Web.Router do
  use Lv1862Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {Lv1862Web.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Lv1862Web do
    pipe_through :browser

    live "/", PageLive
    live "/link", LinkLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", Lv1862Web do
  #   pipe_through :api
  # end
end
