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

Repo.delete_all(product)

Repo.insert!(%Post{user:"JonahMIn", title:"title", post:"body", likes:1})
Repo.insert!(%User{user_id: 1, username:"JonahMin", email:"email@email.com"})
