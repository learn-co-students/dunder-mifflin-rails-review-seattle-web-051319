class DogsController < ApplicationController
    before_action :get_dog, only: [:show, :edit, :update]

    def index 
        @dogs = Dog.all
    end

    def new 
        @dog = Dog.new()
    end

    def show 

    end

    private 
    def get_dog
        return @dog = Dog.find(params[:id])
    end
end
