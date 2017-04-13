defmodule Bookstore.Inventory do
  alias Bookstore.Inventory.Book
  alias Bookstore.Repo

  @spec create_book(Book.params)
  :: {:ok, Book.t}
  |  {:error, Ecto.Changeset}
  def create_book(book_params) do
    cs = Book.changeset(%Book{}, book_params)

    if cs.valid? do
      case Repo.insert(cs) do
        {:ok, book} -> {:ok, book}
        {:error, changeset} -> {:error, changeset}
      end
    else
      {:error, cs}
    end
  end
end
