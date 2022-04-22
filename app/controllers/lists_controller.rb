class ListsController < ApplicationController

  def index
    @lists = List.all
    end

  def new
    @list = List.new

  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render "lists/new"
    end
  end

  def show
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  private

  def list_params
    params.require(:list).permit(:name)

  end

  # def available_movies
  #   @list = List.find(params[:id])
  #   movies_in_list = @list.movies
  #   available_movies = Movie.all

  #   #Deleting all the movies that are in the list from the list of movies
  #   movies_in_list.each do |movie|
  #     available_movies.delete(movie)
  #   end

  #   return available_movies

  # end
end
