defmodule Ecto.Integration.Upserts do
  use Ecto.Integration.Case

  require Ecto.Integration.TestRepo, as: TestRepo

  alias Ecto.Integration.Post

  test "update if record exists on insert" do
    p1 = TestRepo.insert!(%Post{title: "1", visits: 1})
    TestRepo.insert!(%Post{title: "2", id: p1.id, visits: 3}, :field :title, includes: [:title, :id, :visit])

    p1 = TestRepo.get(Post, p1.id)
    assert p1.title == "2"
    assert p1.visits == 3
  end

  test "insert if record exists on update" do
  end

  test "ignore if record exists on update" do
  end

  test "error if record exists on update" do
  end
end
