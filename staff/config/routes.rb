Rails.application.routes.draw do
  resources :school_teachers
  resources :school_course_teachers
  resources :school_courses
  resources :teacher_specialties
  resources :teachers
  resources :people
  resources :school_classes
  resources :lesson_assignments
  resources :lessons
  resources :lesson_types
  resources :school_grade_specialties
  resources :school_grades
  resources :schoolyears
  resources :schools
  resources :specialties
  resources :teacher_working_classes
  # For details on the DSL available within this file, see 
  # http://guides.rubyonrails.org/routing.html
  #
  resources :school_classes do
    member do
      get 'duplicate'
    end
  end

  get '/pick_school', to: 'personel_processor#pick_school'
  get '/pick_teacher/:school_id', 
    to: 'personel_processor#pick_teacher',
    as: "pick_teacher_for"

  get '/pick_lessons/:teacher_id/show_status/:school_id', 
    to: 'personel_processor#show_status',
    as: 'pick_lessons_for'

  post '/pick_lessons/:teacher_id/register/:school_id',
    to: 'personel_processor#register_lessons',
    as: 'register_these_lessons_for'


end
