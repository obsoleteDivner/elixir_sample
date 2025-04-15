defmodule ElixirSample.Routes do
  import N2O

  def finish(state, ctx), do: {:ok, state, ctx}

  def init(state, ctx) do
    %{path: path} = cx(ctx, :req)
    {:ok, state, cx(ctx, path: path, module: route_prefix(path))}
  end

  def route_prefix(<<"/ws/", p::binary>>), do: route(p)
  def route_prefix(<<"/", p::binary>>), do: route(p)
  def route_prefix(p), do: route(p)

  def route(<<"app/room", _::binary>>), do: ElixirSample.Rooms
  def route(_), do: ElixirSample.Index
end
