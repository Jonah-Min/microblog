defmodule Microblog.Feedback.Like do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Feedback.Like

  schema "likes" do
    field :liked, :boolean, default: false
    belongs_to :post, Microblog.Blog.Post
    belongs_to :user, Microblog.Account.User

    timestamps()
  end

  @doc false
  def changeset(%Like{} = like, attrs) do
    like
    |> cast(attrs, [:liked, :user_id, :post_id])
    |> validate_required([:liked, :user_id, :post_id])
  end
end
