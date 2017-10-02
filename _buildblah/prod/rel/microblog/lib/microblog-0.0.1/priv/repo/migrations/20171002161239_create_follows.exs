defmodule Microblog.Repo.Migrations.CreateFollows do
  use Ecto.Migration

  def change do
    create table(:follows) do
      add :follower_user_id, :integer
      add :following_user_id, :integer

      timestamps()
    end

  end
end
