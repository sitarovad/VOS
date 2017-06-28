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

  def recommend
    best_films = UserFilm.where(user_id: session[:user_id]).order('rating DESC').limit(5)
    @films = []
    @hash_films = {}

    if best_films.empty?
      flash[:danger] = "We don't have enough data. Please, add some films to your films."
      redirect_to user_user_films_path(current_user)
    else
      best_films.each do |film|
        directors = Tmdb::Movie.director(film.film_id)

        if directors.empty?
          next
        end

        films_temp = Tmdb::Person.movie_credits(directors[0].id).crew
        films = []

        films_temp.each do |t|
          films.push(t.id)
          if @hash_films[t.id].nil?
            @hash_films[t.id] = t.title
          end
        end

        films.uniq!
        genres = Tmdb::Movie.detail(film.film_id).genres

        films.each do |f|
          film_genres = Tmdb::Movie.detail(f).genres
          temp = genres & film_genres
          if temp.empty?
            films.delete(f)
          end
        end

        films.delete(film.film_id)
        @films += films
      end
    end
  end

  private

  def user_film_params

    params.permit(:seen_at, :rating, :user_id, :film_id)
  end
end
