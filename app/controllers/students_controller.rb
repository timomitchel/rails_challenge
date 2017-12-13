class StudentsController < ApplicationController
   before_action :set_student, only: [:show, :destroy, :edit, :update]
  
  def index
    @students = Student.all
  end

  def create
    @student = Student.create(params[:student])
  end

  def new

  end

  def edit
    
  end

  def show

  end

  def update

  end

  def destroy

  end


  private

  def set_student
    @student = Student.find(params[:id])
  end

end