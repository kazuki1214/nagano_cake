class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @new_genre = Genre.new
  end

  def create
    genres = Genre.new(genre_params)
    genres.save
    redirect_to admin_genres
  end

  def edit
    @genre = Gnere.find(params[:id])
  end

  def update
    genre = Genre.find(params[:id])
    genre.update(genre_params)
    redirect_to admin_genres
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end
