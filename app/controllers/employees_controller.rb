class EmployeesController < ApplicationController
  before_action :set_params, only: [:show, :edit, :update]

  def index
    @employees = Employee.all
    render :index
  end

  def show
    set_params
    render :show
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

  def edit
    set_params
    render :edit
  end

  def update
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render :edit
    end
  end

  private
  def set_params
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id)
  end

end
