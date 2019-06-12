class EmployeesController < ApplicationController
    before_action :get_employee, only: [:show, :update, :edit]

    def index 
        @employees = Employee.all
    end

    def new 
        @employee = Employee.new()
    end

    def create 
        @employee = Employee.new(employee_params)
        if @employee.save 
            redirect_to @employee
        else 
            render :'new'
        end
    end

    def update 
        if @employee.update(employee_params)
            redirect_to @employee
        else 
            render :'edit'
        end
    end

    private 
    def get_employee
        return @employee = Employee.find(params[:id])
    end

    def employee_params
        return params.require(:employee).permit!
    end

end
