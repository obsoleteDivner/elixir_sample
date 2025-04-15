defmodule ElixirSample.Index do
  require NITRO
  require N2O

  def event(:init) do
    :nitro.update(:room1, NITRO.button(id: :room1, body: "Room 1", postback: {:room, "room1"}))
    :nitro.update(:room2, NITRO.button(id: :room2, body: "Room 2", postback: {:room, "room2"}))
    :nitro.update(:room3, NITRO.button(id: :room3, body: "Room 3", postback: {:room, "room3"}))
  end

  def event({:room, room}) do
    :n2o.session(:room, room)
    :nitro.redirect("/app/rooms.htm?room=#{room}")
  end

  def event(_), do: :ok
end
