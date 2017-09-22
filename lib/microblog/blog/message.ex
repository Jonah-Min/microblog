defmodule Microblog.Blog.Message do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.Message


  schema "messages" do
    field :likes, :integer
    field :post, :string
    field :titltle, :string
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(%Message{} = message, attrs) do
    message
    |> cast(attrs, [:user_id, :titltle, :post, :likes])
    |> validate_required([:user_id, :titltle, :post, :likes])
  end
end
