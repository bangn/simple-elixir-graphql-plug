defmodule Router do
  import Plug.Conn
  use Plug.Router

  plug :match
  plug :dispatch

  def start_link do
    Plug.Adapters.Cowboy.http __MODULE__, []
  end

  get "/graphql" do
    conn = fetch_query_params(conn)
    %{ "query" => query } = conn.params

    {:ok, data} = GraphQL.execute(Schema.schema, "{#{query}}")
    {:ok, json} = Poison.encode(%{data: data})

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, json)
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end
end
