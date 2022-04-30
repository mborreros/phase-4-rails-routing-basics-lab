class StudentsController < ApplicationController

  def index
    students = Student.all
    render json: students 
  end

  def grades
    students_by_grade = Student.all.order(grade: :desc)
    render json: students_by_grade
  end

  def highest_grade
    highest_grade = Student.all.order(grade: :desc).limit(1)
    # render json: {
    #   first_name: highest_grade.first_name, last_name: highest_grade.last_name, grade: highest_grade.grade
    # }
    render json: highest_grade[0], only: [:first_name, :last_name, :grade]
  end

end
