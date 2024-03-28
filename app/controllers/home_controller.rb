class HomeController < ApplicationController
    def index
        @genres = Genre.all
        @movies = Movie.all
        @directors = Director.all        
    end
end
