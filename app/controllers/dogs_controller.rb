class DogsController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update, :destroy]

  def index
    @dogs = Dog.all
    @sort = ""
  end

  def sort
    if params[:sorter] == "minimum"
      @dogs = Dog.all.sort_by {|dog| dog.employees.count}
      render :index
    else
      @dogs = Dog.all.sort_by {|dog| -dog.employees.count}
      render :index
    end
  end

  def show
    @employees = @dog.employees
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to @dog
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @dog.update(dog_params)
      redirect_to @dog
    else
      render :edit
    end
  end

  private

  def set_params
    @dog = Dog.find(params[:id])
  end

  def dog_params
    params.require(:dog).permit(:name, :breed, :age)
  end

end
