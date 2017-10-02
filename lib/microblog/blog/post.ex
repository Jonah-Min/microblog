defmodule Microblog.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Blog.Post


  schema "posts" do
    field :likes, :integer
    field :post, :string
    field :title, :string
    field :user, :string

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, [:user, :title, :post, :likes])
    |> validate_required([:user, :title, :post, :likes])
  end
end
