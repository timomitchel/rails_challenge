class StudentsController < ApplicationController
   before_action :set_student, only: [:show, :destroy, :edit, :update]
  
  def index
    @students = Student.all
  end

  def create
    @student = Student.create(student_params)
    @course = Course.find(params[:course][:course_id])
    if @student.save
      @course.student << @student
      flash[:success] = "#{@student.name} added"
      redirect_to student_path(@student)
    else
      render :new
    end
  end

  def new
    @course = Course.all
    @student = Student.new
  end

  def edit
    
  end

  def show
    @courses = Course.find(params[:course][:course_id])
  end

  def update
    @student.update(student_params)
    if @student.save
      flash[:success] = "#{@student.name} updated"
      redirect_to student_path(@student)
    else
      render :edit
    end
  end

  def destroy
    @student.destroy

    flash[:success] = "#{@student.name} deleted"
    redirect_to students_path
  end


  private

  def set_student
    @student = Student.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :course_ids => [])
  end

end