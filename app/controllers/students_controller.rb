class StudentsController < ApplicationController
   before_action :set_student, only: [:show, :destroy, :edit, :update]
  
  def index
    @students = Student.all
  end

  def create
    @student = Student.create(student_params)
    if @student.save
      flash[:success] = "#{@student.name} added"
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def new
    @student = Student.new
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

  def student_params
    params.require(:student).permit(:name)
  end

end