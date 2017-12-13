class Student < ApplicationRecord
  validates_presence_of :name 
  has_many :addresses
  has_many :courses, through: course_students
end