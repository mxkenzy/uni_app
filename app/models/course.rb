class Course < ApplicationRecord
  validates :name, presence: true, length: {minimum: 5, maximum: 35}
  validates :description, presence: true, length: {minimum: 5, maximum: 200}
  validates :short_name, presence: true

  has_many :student_courses
  has_many :students, through: :student_courses
end