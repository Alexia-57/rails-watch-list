class BookmarksController < ApplicationController
  def new
    # We need @bookmark in our `simple_form_for`
    @list = List.find(params[:list_id]) # not params[:id]
    @bookmark = Bookmark.new
  end

  def create
    # build the bookmark with content
    @bookmark = Bookmark.new(bookmark_params)
    # find the list
    @list = List.find(params[:list_id])
    # associate the bookmark with list instance (e.g: id 5)
    @bookmark.list = @list # or @bookmark.list_id = @list.id
    # save
    if @bookmark.save # if doesn't work, returns false
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity # HTTP 422 error
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:list_id])
    @bookmark.destroy
    redirect_to list_path(@list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
