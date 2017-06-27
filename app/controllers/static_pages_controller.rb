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

  def search
    @people = Tmdb::Search.person(params[:search], page: params[:page])
    @search = params[:search]
  end
end
