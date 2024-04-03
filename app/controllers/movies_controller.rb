class MoviesController < ApplicationController
    def show
        @movie = Movie.find(params[:id])
        @genres = @movie.genre
        @director = @movie.director
    end

    def index
        @movies = Movie.all
    end

    def new
        @movie = Movie.new
    end

    def create
        @movie = Movie.new(movie_params)

        if @movie.save
            redirect_to root_path, notice: 'Movie was successfully created.'
        else
            render :new
        end
    end

    def edit
        @movie = Movie.find(params[:id])
    end

    def update
        @movie = Movie.find(params[:id])

        if @movie.update(movie_params)
            redirect_to root_path, notice: 'Movie was successfully updated.'
        else
            render :edit
        end
    end

    private

    def movie_params
        params.require(:movie).permit(:title, :director_id, :synopsis, :country, :duration, :year, :genre_id, :status, :poster)
    end
end
