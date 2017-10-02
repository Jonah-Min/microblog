defmodule Microblog.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :user_id, :integer
      add :titltle, :string
      add :post, :text
      add :likes, :integer

      timestamps()
    end

  end
end
