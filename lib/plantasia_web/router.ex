defmodule PlantasiaWeb.Router do
  use PlantasiaWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: PlantasiaWeb.Schema,
      json_codec: Jason

    forward "/", Absinthe.Plug,
      schema: PlantasiaWeb.Schema, json_codec: Jason
  end
end
