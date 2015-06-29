class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update #Instance variables in Rails do not live on after the action run
    @movie = Movie.find(params[:id])
    @movie.update(movie_params)
    redirect_to @movie
  end

  private

    def movie_params
      params.require(:movie).permit(:title, :description, :rating, :release_on, :total_gross)
      #Or .permit! if you want all of a movie's attributes to be updatable without listing them out
    end
end
