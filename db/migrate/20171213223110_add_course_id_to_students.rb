class AddCourseIdToStudents < ActiveRecord::Migration[5.1]
  def change
    add_reference :students, :course, index: true, foreign_key: true
  end
end
