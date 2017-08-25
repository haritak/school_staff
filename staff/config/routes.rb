Rails.application.routes.draw do
  resources :school_grade_specialties
  resources :school_grades
  resources :schoolyears
  resources :schools
  resources :specialties
  resources :teacher_working_classes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
