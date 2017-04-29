class UserFilmsController < ApplicationController
  def new
  end

  def show
    @user_film = UserFilm.find(params[:id])
  end

  def create
    user = User.find_by(id: session[:user_id])
    user.user_films.where(user_film_params).first_or_create(user_film_params)
    redirect_to user_user_films_url
  end

  def index
    @user_films = UserFilm.where(user_id: session[:user_id]).joins(:film).paginate(page: params[:page])

  end

  private

  def user_film_params

    params.permit(:seen_at, :rating, :film_id)
  end
end
