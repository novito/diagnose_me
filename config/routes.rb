Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :patient_cases, :path => 'cases'

  namespace :practitioner do
    resources :patient_cases, :path => 'cases' do
      resources :diagnoses
    end
  end
end
