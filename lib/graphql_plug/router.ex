defmodule Router do
  use Plug.Router

  plug :match
  plug :dispatch

  def start_link do
    Plug.Adapters.Cowboy.http __MODULE__, []
  end

  get "/graphql" do
    conn
    |> send_resp(200, "GraphQL response")
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
