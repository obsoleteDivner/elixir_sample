defmodule ElixirSample.Rooms do
  require NITRO
  require N2O

  def event(:init) do
    room = :n2o.session(:room)
    :n2o.reg({:topic, room})
    :nitro.update(:heading, NITRO.h2(id: :heading, body: room))
    :nitro.update(:send, NITRO.button(id: :send, body: "Send", postback: :chat, source: [:message]))

  end

  def event(:chat) do
    message = :nitro.q(:message)
    user = :n2o.user()
    room = :n2o.session(:room)

    :n2o.send({:topic, room}, N2O.client(data: {user, message}))
  end

  def event({:client, {user, message}}) do
    :nitro.wire(NITRO.jq(target: :message, method: [:focus, :select]))

    :nitro.insert_top(:history,
      NITRO.message(body: [
        NITRO.author(body: user),
        :nitro.jse(message)
      ])
    )
  end

  def event(_) do
    :ok
  end

end
