class DirectorsController < ApplicationController
  def show
    @director = Director.find(params[:id])
  end

  def index
    @directors = Director.search(params[:search], params[:id]).paginate(page: params[:page])
  end

  def create
    @director = Director.new(director_params)
    if @director.save
      flash[:success] = "New director was added successfully!"
      redirect_to directors_path
    else
      flash[:danger] = "Fail, try it again!"
      render 'new'
    end
  end

  def new
  end

  private

  def director_params
    params.require(:director).permit(:name, :date_of_birth, :biography)
  end
end
