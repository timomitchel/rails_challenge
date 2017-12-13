class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.text :name
      
      t.references :student, index: true, foreign_key: true
    end
  end
end
