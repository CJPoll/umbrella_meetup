defmodule UmbrellaApi.External.PageController do
  use UmbrellaApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
