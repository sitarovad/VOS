class ActorsController < ApplicationController

  def new
  end

  def show
    # @actor = Actor.find(params[:id])
    @actor = Tmdb::Person.detail(params[:id])
  end

  def index
    @actors = Actor.search(params[:search], params[:id]).paginate(page: params[:page])
  end

  def edit

  end

  def create
    @actor = Actor.new(actor_params)
    if @actor.save
      flash[:success] = "New actor was added succesfully!"
      redirect_to actors_path
    else
      flash[:danger] = "Fail, try it again!"
      render 'new'
    end
  end

  def update

  end

  def destroy

  end

  private

  def actor_params
    params.require(:actor).permit(:name, :date_of_birth, :biography)
  end
end
