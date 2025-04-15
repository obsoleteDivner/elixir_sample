defmodule ElixirSample.Application do
  require N2O
  use Application
  def start(_type, _args) do
    dispatch = :cowboy_router.compile([
      {:_, [
        {"/favicon.ico", :cowboy_static, {:file, "priv/static/favicon.ico", []}},
        {"/n2o/[...]",   :cowboy_static, {:dir, "deps/n2o/priv", []}},
        {"/app/[...]",   :cowboy_static, {:dir, "priv/static", []}},
        {"/ws/[...]",    :n2o_cowboy, []},
        {"/nitro/[...]", :cowboy_static, {:dir, "deps/nitro/priv", []}}
      ]}
    ])

    :cowboy.start_clear(
      :http,
      [{:port, 8001}],
      %{env: %{dispatch: dispatch}}
    )

    Supervisor.start_link([], strategy: :one_for_one)
  end
end
