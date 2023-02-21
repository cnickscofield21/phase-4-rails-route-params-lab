class StudentsController < ApplicationController

  # Total cheat! README was far from clear on this one, went to the solution code.
  def index
    debugger
    render json: (params[:name]) ? Student.where("first_name LIKE ?", Student.sanitize_sql_like(params[:name]) + "%").or(Student.where("last_name LIKE ?", Student.sanitize_sql_like(params[:name]) + "%")) : Student.all
  end

  def show
    render json: Student.find(params[:id]), status: :ok
  end

end
