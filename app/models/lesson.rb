class Lesson < ApplicationRecord
  has_one_attached :video do |attachable|
    attachable.variant :thumb, resize: [500, 500]
  end

  acts_as_list
  has_rich_text :description
  
  belongs_to :course
  has_many :lesson_users, dependent: :destroy


  def previous_lesson
    course.lessons.where("position < ?", position).order(:position).last
  end

  def next_lesson
    course.lessons.where("position > ?", position).order(:position).first
  end
end
