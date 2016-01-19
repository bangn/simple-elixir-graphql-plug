# GraphqlPlug

A simple Facebook's GraphQL server using GraphQL-Elixir and Plug

## Installation

  1. Clone this repo

  2. Run `mix deps.get`


## Usage

  1. Run `iex -S mix`

  2. `curl -v -L "http://localhost:4000/graphql?query={greeting}"`

  3. You should get `{"data":{"greeting":"Hello, world!"}}` json response

## Credit

The schema is get from https://github.com/joshprice/plug_graphql


