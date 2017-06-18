class FilmsController < ApplicationController
  def new
  end

  def show
    @film = Film.find(params[:id])
  end

  def create
    genres = genres_params[:genre_id]
    genres.shift

    actors = actors_params[:actor_id]
    actors.shift

    Film.transaction do
      film = Film.where(films_params).first_or_create(films_params)
      genres.each do |genre|
        film.film_genres.where(genre_id: genre).first_or_create(genre_id: genre)
      end
      actors.each do |actor|
        film.film_actors.where(actor_id: actor).first_or_create(actor_id: actor)
      end
      flash[:success] = "Heureka!"
    end

  end

  def index
    @films = Film.search(params[:search], params[:id]).paginate(page: params[:page])
  end

  def genres
    #SELECT label, count(fg.film_id) FROM genres g
    #JOIN film_genres fg ON fg.genre_id = g.id
    #GROUP BY g.label
    @film_genres = FilmGenre.joins(:genre).group(:label).count(:film_id)
  end

  def genres_index
    #SELECT f.name, f.id FROM films f
    #JOIN film_genres fg ON fg.film_id = f.id
    #WHERE fg.genre_id = ( SELECT g.id FROM genres g
    #                       WHERE label = :genre)
    @film_genres = FilmGenre.joins(:film).joins(:genre).where("genres.label LIKE ?", params[:genre]).paginate(page: params[:page])
  end

  private

  def films_params
    params.require(:film).permit(:name, :created_at, :length, :rating, :content)
  end


  def genres_params
    params[:FilmGenre][:genre_id] ||= []
    params.require(:FilmGenre).permit(genre_id: [])
  end

  def actors_params
    params[:FilmActor][:actor_id] ||= []
    params.require(:FilmActor).permit(actor_id: [])
  end
end
