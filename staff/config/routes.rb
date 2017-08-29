Rails.application.routes.draw do
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

  get '/requirements', to: 'personel_processor#requirements'


end
