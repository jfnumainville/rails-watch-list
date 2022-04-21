class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @movies = Movie.all
    @bookmarks = Bookmark.where(list_id: "#{@list.id}")
  end

  private

  def eligible_movies
    @list = List.find(params[:id])
    movies_in_list = @list.movies
    all_movies = Movie.all






  end
end
