class BookmarksController < ApplicationController

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list_id)

  end

  def new
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list_id = @list.id

    if @bookmark.save
      redirect_to list_path(@list)
    else
      render 'lists/show'
    end
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
