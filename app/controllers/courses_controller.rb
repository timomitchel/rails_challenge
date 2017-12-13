class CoursesController < ApplicationController
   before_action :set_course, only: [:show, :destroy, :edit, :update]
  
  def index
    @courses = Course.all
  end

  def create
    @course = Course.create(course_params)
    @course = course.find(params[:course][:course_id])
    if @course.save
      @course.course << @course
      flash[:success] = "#{@course.name} added"
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  def new
    @course = course.all
    @course = Course.new
  end

  def edit
    
  end

  def show

  end

  def update
    @course.update(course_params)
    if @course.save
      flash[:success] = "#{@course.name} updated"
      redirect_to course_path(@course)
    else
      render :edit
    end
  end

  def destroy
    @course.destroy

    flash[:success] = "#{@course.name} deleted"
    redirect_to courses_path
  end


  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :student_ids => [])
  end

end