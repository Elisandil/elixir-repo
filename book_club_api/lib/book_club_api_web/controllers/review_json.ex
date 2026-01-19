defmodule BookClubApiWeb.ReviewJSON do
  alias BookClubApi.Reviews.Review
  alias BookClubApi.Books.Book
  alias BookClubApi.Members.Member

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
      comment: review.comment,
      book: book_data(review.book),
      member: member_data(review.member),
      inserted_at: review.inserted_at
    }
  end

  defp book_data(%Book{} = book) do
    %{
      id: book.id,
      title: book.title,
      author: book.author
    }
  end

  defp book_data(_), do: nil

  defp member_data(%Member{} = member) do
    %{
      id: member.id,
      name: member.name
    }
  end

  defp member_data(_), do: nil
end
