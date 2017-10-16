defmodule Microblog.Account.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Microblog.Account.User


  schema "users" do
    field :email, :string
    field :user_id, :integer
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:user_id, :username, :email])
    |> validate_required([:user_id, :username, :email])
  end
end
