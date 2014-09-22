Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :patient_cases, :path => 'cases'

  namespace :practitioner do
    resources :patient_cases, :path => 'cases' do
      resources :diagnoses
    end
  end

  # Static Pages
  get 'terms_and_conditions', to: 'pages#terms_and_conditions'
  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'
end
