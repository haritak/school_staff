Rails.application.routes.draw do


  controller :sessions do
    get 'login' => :new #get 'sessions/new'
    post 'login' => :create #get 'sessions/create'
    delete 'logout' => :destroy #get 'sessions/destroy'
  end

  resources :users
  resources :settings
  resources :decision_files
  get '/create_decision_files/:school_teacher_response',
    to: 'decision_files#create_decision_files',
    as: 'create_decision_files'
  get '/decision_files/:decision_file/download',
    to: 'decision_files#download',
    as: 'download_decision'

  resources :request_support_documents
  resources :school_teacher_responses
  resources :response_specifications
  get '/response_specification/:id/download',
    to: 'response_specifications#download',
    as: 'download_response_specification'

  get '/school_teachers/new_all'
  post '/school_teachers/new_all', 
    to: 'school_teachers#create_all'

  resources :school_teacher_requests
  get '/school_teacher_requests/:id/add_support_document',
    to: "school_teacher_requests#add_support_document",
    as: "add_support_document"
  resources :request_specifications
  resources :school_class_lessons
  resources :school_class_students
  resources :school_students
  resources :student_bus_cards
  resources :student_photos
  resources :student_residence_addresses
  resources :student_residence_towns
  resources :student_personal_mobiles
  resources :student_parent_mobiles
  resources :student_contact_infos
  resources :students
  get 'log_books/index'

  get 'schedule/save_form'
  post 'schedule/save'
  get 'schedule/diff'
  post 'schedule/diff'
  get 'schedule/index'
  get 'schedule/diff_general'
  get '/people/phones', to: 'people#phones'

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

  get '/homepage/:teacher_id/school/:school_id', 
    to: 'personel_processor#homepage',
    as: 'school_teacher_homepage'

  get '/homepage/:teacher_id/school/:school_id/select_request', 
    to: 'personel_processor#select_request_type',
    as: 'select_request_type'



  #requests
  get '/request/history/:school_teacher_id',
    to: 'school_teacher_requests#history',
    as: 'history_of_requests'

  get '/request/:school_teacher_id/:request_specification_id',
    to: 'school_teacher_requests#apply_new',
    as: 'apply_request'

  post '/request/:school_teacher_id/:request_specification_id',
    to: 'school_teacher_requests#create_request',
    as: 'create_request'

  get '/school_teacher_request/:school_teacher_request/download',
    to: 'school_teacher_requests#download',
    as: 'download_request'




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
