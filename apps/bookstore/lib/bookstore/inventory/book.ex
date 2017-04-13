defmodule Bookstore.Inventory.Book do
  use Ecto.Schema

  import Ecto.Changeset

  @allowed_fields [:name, :pages]
  @required_fields [:name]

  schema "books" do
    field :name, :string
    field :pages, :integer
  end

  @type t :: %__MODULE__{}
  @type params :: %{
    :name => String.t,
    optional(:pages) => integer
  }

  def changeset(struct, params) do
    struct
    |> cast(params, @allowed_fields)
    |> validate_required(@required_fields)
  end
end
