class StudentController < ApplicationController
   before_action :set_student, only: [:show, :destroy, :edit, :update]
  
  def create

  end

  private

  def set_student
    @student = Student.find(params[:id])
  end

end