class Student < ApplicationRecord
  validates_presence_of :name 
  has_many :addresses
  has_many_and_belongs_to :courses
end