class Admin::GenresController < Admin::ApplicationsController
  def index
    @genres = Genre.all
    @new_genre = Genre.new
  end

  def create
    @genres = Genre.new(genre_params)
    if @genres.save
      redirect_to admin_genres_path
    else
      render admin_genres_path
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path
    else
      render edit_admin_genre_path
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end
