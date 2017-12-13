class Address < ApplicationRecord
  validates_presence_of :description, :city, :street, :state, :zip_code, :student_id
  belongs_to :student
end