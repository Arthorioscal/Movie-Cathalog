class DirectorsController < ApplicationController
    def show
        @director = Director.find(params[:id])
        @movies = Movie.where(director_id: @director.id)
    end

    def index
        @directors = Director.all
    end

    def new
        @director = Director.new
    end

    def create
        @director = Director.new(director_params)

        if @director.save
            redirect_to root_path, notice: 'Director was successfully created.'
        else
            render :new
        end
    end

    def edit
        @director = Director.find(params[:id])
    end

    def update
        @director = Director.find(params[:id])

        if @director.update(director_params)
            redirect_to root_path, notice: 'Director was successfully updated.'
        else
            render :edit
        end
    end

    private

    def director_params
        params.require(:director).permit(:name, :age, :nationality, :favorite_genre)
    end
end
