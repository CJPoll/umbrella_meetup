defmodule Bookstore do
  use Application

  def start(_, _) do
    import Supervisor.Spec

    children = [
      supervisor(Bookstore.Repo, []),
      supervisor(Bookstore.Service.Supervisor, [])
    ]

    opts = [strategy: :one_for_one, name: Bookstore.Supervisor]

    Supervisor.start_link(children, opts)
  end
end
