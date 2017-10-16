defmodule MicroblogWeb.PostControllerTest do
  use MicroblogWeb.ConnCase

  alias Microblog.Blog

  @create_attrs %{likes: 42, post: "some post", title: "some title", user: "some user"}
  @update_attrs %{likes: 43, post: "some updated post", title: "some updated title", user: "some updated user"}
  @invalid_attrs %{likes: nil, post: nil, title: nil, user: nil}

  def fixture(:post) do
    {:ok, post} = Blog.create_post(@create_attrs)
    post
  end

  describe "edit post" do
    setup [:create_post]
  end

  describe "update post" do
    setup [:create_post]

    test "redirects when data is valid", %{conn: conn, post: post} do
      conn = put conn, post_path(conn, :update, post), post: @update_attrs
      assert redirected_to(conn) == post_path(conn, :show, post)

      conn = get conn, post_path(conn, :show, post)
      assert html_response(conn, 200) =~ "some updated post"
    end
  end

  describe "delete post" do
    setup [:create_post]

    test "deletes chosen post", %{conn: conn, post: post} do
      conn = delete conn, post_path(conn, :delete, post)
      assert redirected_to(conn) == post_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, post_path(conn, :show, post)
      end
    end
  end

  defp create_post(_) do
    post = fixture(:post)
    {:ok, post: post}
  end
end
