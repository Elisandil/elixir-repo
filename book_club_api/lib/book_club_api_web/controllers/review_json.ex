defmodule BookClubApiWeb.ReviewJSON do
  alias BookClubApi.Reviews.Review

  @doc """
  Renders a list of reviews.
  """
  def index(%{reviews: reviews}) do
    %{data: for(review <- reviews, do: data(review))}
  end

  @doc """
  Renders a single review.
  """
  def show(%{review: review}) do
    %{data: data(review)}
  end

  defp data(%Review{} = review) do
    %{
      id: review.id,
      rating: review.rating,
      comment: review.comment
    }
  end
end
