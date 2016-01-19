defmodule Schema do
  def schema do
    %GraphQL.Schema{
      query: %GraphQL.ObjectType{
        name: "RootQueryType",
        fields: %{
          greeting: %{
            type: "String",
            resolve: &Schema.greeting/3
          }
        }
      }
    }
  end

  def greeting(_, _, _), do: "Hello, world!"
end
