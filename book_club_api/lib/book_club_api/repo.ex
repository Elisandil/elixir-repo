defmodule BookClubApi.Repo do
   use Ecto.Repo,
     otp_app: :book_club_api,
     adapter: Ecto.Adapters.SQLite3
end
