class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update]
  skip_before_action :require_user, only: [:index]
  
  def index
  	@courses = Course.all
  end

  def show
  end

  def new
  	@course = Course.new
  end

  def create
  	@course = Course.new(course_params)
  	if @course.save
  	  flash[:success] = "You have successfully added a course"
  	  redirect_to @course
  	else
  	  render 'new'
  	end
  end

  def edit
  end

  def update
  	if @course.update(course_params)
  	  flash[:success] = "You have successfully edited course"
  	  redirect_to @course
  	else
  	  render 'edit'
  	end
  end

  private

  def course_params
  	params.require(:course).permit(:short_name, :name, :description)
  end

  def set_course
  	@course = Course.find(params[:id])
  end

end