defmodule ImbaAppWeb.Router do
  use ImbaAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
    plug Plug.Parsers,
      parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
      pass: ["*/*"],
      json_decoder: Poison
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: ImbaAppWeb.Schema,
      interface: :simple,
      context: %{pubsub: ImbaAppWeb.Endpoint}
  end
end
