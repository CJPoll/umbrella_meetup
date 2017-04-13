defmodule Bookstore.Service do
  use GenServer

  @opaque t :: pid

  defmodule State do
    defstruct []
  end

  # Public API

  def start_link do
    GenServer.start_link(__MODULE__, [])
  end

  @spec create_book(t, Bookstore.Inventory.Book.params)
  :: Book.t
  def create_book(bookstore, book_params) do
    GenServer.call(bookstore, {:create_book, book_params})
  end

  # GenServer Handlers

  def init(_) do
    IO.inspect("Starting Bookstore Service")
    {:ok, %State{}}
  end

  def handle_call({:create_book, book_params}, _from, %State{} = state) do
    response =
      case Bookstore.Inventory.create_book(book_params) do
        {:ok, book} -> book
        {:error, changeset} -> changeset.errors
      end

    {:reply, response, state}
  end
end
