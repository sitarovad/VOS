class UserFilmsController < ApplicationController
  def new
  end

  def show
    @user_film = UserFilm.find(params[:id])
  end

  def create
    #user = User.find_by(id: session[:user_id])
    #user.user_films.where(user_film_params).first_or_create(user_film_params)
    @user_film = UserFilm.where(user_film_params).first_or_create(user_film_params)
    if @user_film.save
      flash[:success] = "New film was added to my films!"
      redirect_to user_user_films_url
    else
      flash[:danger] = "Fail, try it again!"
      render 'new'
    end
    #redirect_to user_user_films_url
  end

  def index
    @user_films = UserFilm.where(user_id: session[:user_id])

  end

  private

  def user_film_params

    params.permit(:seen_at, :rating, :user_id, :film_id)
  end
end
