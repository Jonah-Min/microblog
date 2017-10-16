defmodule Microblog.FeedbackTest do
  use Microblog.DataCase

  alias Microblog.Feedback

  describe "likes" do
    alias Microblog.Feedback.Like

    @valid_attrs %{liked: true}
    @update_attrs %{liked: false}
    @invalid_attrs %{liked: nil}

    test "create_like/1 with invalid data returns error" do
      assert {:error, %Ecto.Changeset{}} = Feedback.create_like(@invalid_attrs)
    end
  end
end
