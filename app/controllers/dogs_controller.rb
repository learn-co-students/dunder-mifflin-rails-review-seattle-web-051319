class DogsController < ApplicationController

  def index
    @dogs = Dog.all.sort_by {|dog| - dog.employees.count}
    render :index
  end

  def show
    @dog = Dog.find(params[:id])
    render :show
  end
end
