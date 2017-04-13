defmodule Bookstore.Repo.Migrations.CreateBooksTable do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :name, :string, null: false
      add :pages, :integer
    end
  end
end
