# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Microblog.Repo.insert!(%Microblog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Microblog.Repo
alias Microblog.Account.User
alias Microblog.Blog.Post
alias Microblog.Feedback.Like

Repo.delete_all(Like)
Repo.delete_all(Post)
Repo.delete_all(User)

Repo.insert!(%User{user_id: 1, username: "JonahMin", email: "email@email.com"})
Repo.insert!(%User{user_id: 2, username: "JonahMin2", email: "email2@email.com"})
