class GenresController < ApplicationController

    def show
        @genre = Genre.find(params[:id])
        @movies = Movie.where(genre_id: @genre.id)
    end

    def index
        @genres = Genre.all
    end
    
    def new
        @genre = Genre.new
    end

    def create
        @genre = Genre.new(genre_params)

        if @genre.save
            redirect_to root_path, notice: 'Genre was successfully created.'
        else
            render :new
        end
    end

    def edit
        @genre = Genre.find(params[:id])
    end

    def update
        @genre = Genre.find(params[:id])
        if @genre.update(genre_params)
            redirect_to root_path, notice: "Genêro atualizado com sucesso!"
        else
            render :edit
        end
    end

    private

    def genre_params
        params.require(:genre).permit(:name)
    end
end