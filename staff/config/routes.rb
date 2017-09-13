Rails.application.routes.draw do
  get 'log_books/index'

  get 'schedule/save_form'
  post 'schedule/save'
  get 'schedule/diff'
  post 'schedule/diff'
  get 'schedule/index'
  get 'schedule/diff_general'

  resources :saved_school_course_teachers
  resources :saved_school_courses
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

  delete 'pick_lessons/:teacher_id/remove/:school_id/:school_course_id',
    to: 'personel_processor#unregister_lessons',
    as: 'unregister_from'

  get '/pick_lessons/:teacher_id/pick_not_assigned/:school_id',
    to: 'personel_processor#show_all',
    as: 'pick_unassigned_lessons_for'

  post '/pick_lessons/:teacher_id/pick_not_assigned/:school_id',
    to: 'personel_processor#register_unassigned_lessons',
    as: 'register_these_unassigned_lessons_for'


  root 'personel_processor#pick_school'





  get '/reports', to: 'reports#index'
  get '/reports/classes', to: 'reports#school_classes_report'
  get '/reports/teachers', to: 'reports#school_teachers_report'
  get '/reports/teachers/lessons', to: 'reports#lessons_per_teacher'
  get '/reports/classes/registered_lessons', to: 'reports#registered_lessons_per_class'
  get '/reports/classes/unregistered_lessons', to: 'reports#unregistered_lessons_per_class'

  #get '/pick_teacher/:school_id', 
    #to: 'personel_processor#pick_teacher',
    #as: "pick_teacher_for"
end
