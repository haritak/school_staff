class LogBooksController < ApplicationController
  def index
    @all_school_classes = SchoolClass.all

    @all_lessons = []
    @all_school_classes.each do |school_class|
      lessons = school_class.get_required_lessons
      lessons.each do |lesson|
        @all_lessons << lesson
      end
    end
  end
end
