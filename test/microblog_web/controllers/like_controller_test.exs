defmodule MicroblogWeb.LikeControllerTest do
  use MicroblogWeb.ConnCase

  alias Microblog.Feedback
  alias Microblog.Feedback.Like

  @create_attrs %{liked: true}
  @update_attrs %{liked: false}
  @invalid_attrs %{liked: nil}

  def fixture(:like) do
    {:ok, like} = Feedback.create_like(@create_attrs)
    like
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all likes", %{conn: conn} do
      conn = get conn, like_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create like" do
    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, like_path(conn, :create), like: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  defp create_like(_) do
    like = fixture(:like)
    {:ok, like: like}
  end
end
