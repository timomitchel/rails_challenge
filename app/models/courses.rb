class Courses < ApllicationRecord
  has_many :students, through: :course_students
end