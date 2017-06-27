class FilmsController < ApplicationController

  def new
  end

  def show
    # @film = Film.find(params[:id])
    @film = Tmdb::Movie.detail(params[:id])
  end

  def index
    # @films = Film.search(params[:search], params[:id]).paginate(page: params[:page])
    @films = Tmdb::Movie.popular(page: params[:page])
  end

  def genres
    #SELECT label, count(fg.film_id) FROM genres g
    #JOIN film_genres fg ON fg.genre_id = g.id
    #GROUP BY g.label
    @film_genres = FilmGenre.joins(:genre).group(:label).count(:film_id)
  end

  def search
    if params[:search] and params[:genre].blank?
      @films = Tmdb::Search.movie(params[:search], page: params[:page])
      @search = params[:search]
    elsif params[:genre] and params[:search].blank?
           redirect_to genres_index_path(genre: params[:genre], page: params[:page])
    else
      render 'films/index'
    end
  end

  def genres_index
    #SELECT f.name, f.id FROM films f
    #JOIN film_genres fg ON fg.film_id = f.id
    #WHERE fg.genre_id = ( SELECT g.id FROM genres g
    #                       WHERE label = :genre)
    #@film_genres = FilmGenre.joins(:film).joins(:genre).where("genres.label LIKE ?", params[:genre]).paginate(page: params[:page])
    @film_genres = Tmdb::Genre.movies(params[:genre], page: params[:page])
    @genres = Tmdb::Genre.movie_list
    @genre = params[:genre]
  end

  #def create
  #genres = genres_params[:genre_ids]
  #genres.shift

  #Film.transaction do
  #film = Film.where(films_params).first_or_create(films_params)
  #genres.each do |genre|
  #film.film_genres.where(genre_id: genre).first_or_create(genre_id: genre)
  #end
  #flash[:success] = "New film was added successfully!"
  #redirect_to films_path
  #end

  #end

  #private

  #def films_params
    #params.require(:film).permit(:name, :created_at, :length, :rating, :content)
  #end


  #def genres_params
    #params.require(:film).permit(genre_ids: [])
  #end

end
