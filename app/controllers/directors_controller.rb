class DirectorsController < ApplicationController
  def show
    @director = Director.find(params[:id])
  end

  def index
    @directors = Director.paginate(page: params[:page])
  end

  def create
    @director = Director.new(director_params)
    if @director.save
      flash[:success] = "Added new director"
      redirect_to directors_path
    else
      flash[:danger] = "Fail!"
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
