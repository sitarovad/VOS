class UserFilmsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(id: session[:user_id])
    user.user_films.where(user_film_params).first_or_create(user_film_params)
  end

  private

  def user_film_params

    params.permit(:seen_at, :rating, :film_id)
  end
end
