class DogsController < ApplicationController
 before_action :get_params, only:[:show, :edit, :update]

  def index
    @dogs = Dog.all
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

  def dog_params
    params.require(:dog).permit(:name, :breed, :age)
  end

  def get_params
    @dog = Dog.find(params[:id])
  end



end
