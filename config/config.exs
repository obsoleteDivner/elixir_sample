import Config

config :n2o,
  app: :elixir_sample,
  pickler: :n2o_secret,
  mq: :n2o_syn,
  session: :n2o_session,
  protocols: [:n2o_heart, :nitro_n2o],
  routes: ElixirSample.Routes
