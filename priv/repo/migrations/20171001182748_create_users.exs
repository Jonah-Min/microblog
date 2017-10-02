defmodule Microblog.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :user_id, :integer
      add :username, :string
      add :email, :string

      timestamps()
    end

  end
end
