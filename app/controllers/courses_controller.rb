class CoursesController < ApplicationController
  include Taggable

  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :only => [:enroll]

  # GET /courses
  # GET /courses.json
  def index
    if params[:query].present?
      if current_user.admin?
        @courses = Course.search(params[:query], page: params[:page])
      else
        @courses = Course.search(params[:query], page: params[:page], where: {or: [{approved: true}, {lecturer_id: current_user.id}]})
      end
    else
      if current_user.admin?
        @courses = Course.all.page params[:page]
      else
        @courses = Course.where("approved = ? or lecturer_id = ?", true, current_user.id)
      end
    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  def enroll
    course = Course.find(params[:id])
    course.users << current_user

    redirect_to course, notice: 'Successfully enrolled in course.'
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
         format.html { redirect_to @course, notice: 'Course was successfully updated.' }
         format.json { render :show, status: :ok, location: @course }
      else
         format.html { render :edit }
         format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      p = params.require(:course).
                 permit(:name, :date, :location, :description, :picture).
                 merge(tags: extract_tags(params[:course][:tags]))

      current_user.admin? ? p.merge(approved: true) : p
    end
end
