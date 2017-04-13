defmodule Bookstore.Service.Supervisor do
  use Supervisor

  def start_link do
    import Supervisor.Spec

    Supervisor.start_link(__MODULE__, [], name: Bookstore.Service.Supervisor)
  end

  def init(_) do
    children = [
      worker(Bookstore.Service, [])
    ]

    opts = [strategy: :simple_one_for_one, name: Bookstore.Service.Supervisor]

    supervise(children, opts)
  end

  def start_service(pid) do
    Supervisor.start_child(pid, [])
  end
end
