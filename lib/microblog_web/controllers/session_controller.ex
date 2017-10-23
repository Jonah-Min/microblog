defmodule MicroblogWeb.SessionController do
  use MicroblogWeb, :controller

  alias Microblog.Account

  def get_and_auth_user(email, password) do
    user = Account.get_user_by_email(email)
    case Comeonin.Argon2.check_pass(user, password) do
      {:ok, user} -> user
      _else       -> nil
    end
  end

  def login(conn, %{"email" => email, "password" => password}) do
    user = get_and_auth_user(email, password)

    if user do
#      post = conn.assigns[:current_post]
#      Microblog.Blog.update_post(post, %{user_id: user.id})

      conn
      |> put_session(:user_id, user.id)
      |> put_flash(:info, "Logged in as #{user.username}")
      |> redirect(to: post_path(conn, :index))
    else
      conn
      |> put_session(:user_id, nil)
      |> put_flash(:error, "Bad email/password")
      |> redirect(to: post_path(conn, :index))
    end
  end

  def logout(conn, _args) do
     conn
     |> put_session(:user_id, nil)
     |> put_flash(:info, "Logged out.")
     |> redirect(to: post_path(conn, :index))
  end
end

