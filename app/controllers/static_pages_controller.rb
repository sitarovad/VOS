class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
  end

  def people
    @people = Tmdb::Person.popular(page: params[:page])
  end

  def person
    @person = Tmdb::Person.detail(params[:id])
  end
end
