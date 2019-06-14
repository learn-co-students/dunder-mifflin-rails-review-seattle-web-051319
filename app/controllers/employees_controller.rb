class EmployeesController < ApplicationController

  before_action :set_params, only: [:show, :edit, :update]

  # def show
  # end

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to @employee
    else
      render :new
    end
  end

  # def edit
  # end

  def update
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render :edit
    end
  end

  private

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :title, :alias, :title, :img_url, :dog_id)
  end

  def set_params
    @employee = Employee.find(params[:id])
  end




end
