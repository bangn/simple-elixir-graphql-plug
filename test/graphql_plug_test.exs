defmodule GraphqlPlugTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts Router.init([])

  test "get '/graphql' returns hello world" do
    # Create a test connection
    conn = conn(:get, "/graphql")

    # Invoke the plug
    conn = Router.call(conn, @opts)

    # Assert the response and status
    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "GraphQL response"
  end
end
