defmodule UmbrellaApi.External.BookController do
  use UmbrellaApi.Web, :controller

  def create(conn, params) do
    {:ok, bookstore} =
      Bookstore.Service.Supervisor
      |> Process.whereis()
      |> Bookstore.Service.Supervisor.start_service()

    response = Bookstore.Service.create_book(bookstore, params)

    case response do
      %Book{} = book -> IO.inspect(book)
      errors -> IO.inspect(errors)
    end
  end
end
