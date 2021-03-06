class MoviesController < ApplicationController
  
  before_action :prepare_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.released
  end

  def show
  end

  def edit
  end

  def update 
    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie successfully updated!"
    else
      render :edit
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: "Movie successfully created!"
    else
      render :new
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_path, alert: "Movie successfully deleted!"
  end

  private

    def prepare_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :description, :rating, :released_on, 
                                        :total_gross, :image_file_name, :director, 
                                        :duration, :cast)
      .tap do |p| 
        p[:cast] = p[:cast].split(",").map(&:strip)
      end
    end
end
