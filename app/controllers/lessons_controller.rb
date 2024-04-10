class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[ show update ]
  before_action :set_course
  before_action :check_paid

  def show
    @course = @lesson.course
    @completed_lessons = current_user.lesson_users.where(completed: true).pluck(:lesson_id)
    @paid_for_course = current_user.course_users.where(course: @course).exists?
  end

  def update
    @lesson_user = LessonUser.find_or_create_by(lesson: @lesson, user: current_user)
    @lesson_user.update!(completed: true)
    next_lesson = @course.lessons.where("position > ?", @lesson.position).order(:position).first
    if next_lesson
      redirect_to course_lesson_path(@course, next_lesson)
    else
      redirect_to course_path(@course), notice: "Congratulations! You've completed the course."
    end
  end

  private
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    def set_course
      @course = Course.find(params[:course_id])
    end

    def check_paid
      if @lesson.paid && !current_user.course_users.where(course_id: params[:course_id]).exists?
        if @lesson.previous_lesson
          redirect_to course_lesson_path(@course, @lesson.previous_lesson), notice: "You must purchase the course to access this lesson."
        else
          redirect_to course_path(@course), notice: "You must purchase the course to access this lesson."
        end
      end
    end
end
