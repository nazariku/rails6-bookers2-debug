class FavoritesController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    favorite = @book.favorites.build(user: current_user)
    if favorite.save
    respond_to do |format|
      format.html
      format.js
    end
    else
    end
  end

  def destroy
    book = Book.find(params[:book_id])
    favorite = current_user.favorites.find_by(book_id: book.id)
    if favorite.destroy
      respond_to do |format|
        format.html
        format.js
    end
    else
    end
  end

end
