defmodule ElixirSample.Application do
  require N2O
  use Application
  def start(_type, _args) do
    :ets.new(:messages, [:named_table, :public, :bag])

    :cowboy.start_clear(
      :http,
      [{:port, 8001}],
      %{env: %{dispatch: :n2o_cowboy.points()}}
    )
    Supervisor.start_link([], strategy: :one_for_one)
  end
end
