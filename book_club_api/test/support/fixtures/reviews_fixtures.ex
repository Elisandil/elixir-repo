defmodule BookClubApi.ReviewsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BookClubApi.Reviews` context.
  """

  @doc """
  Generate a review.
  """
  def review_fixture(attrs \\ %{}) do
    {:ok, review} =
      attrs
      |> Enum.into(%{
        comment: "some comment",
        rating: 42
      })
      |> BookClubApi.Reviews.create_review()

    review
  end
end
