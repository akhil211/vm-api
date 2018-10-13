Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    # Version 1 Api routes
    namespace :v1 do

      resource  :tokens, only: [:create] do
        post :request_otp, on: :collection
        post :mobile_authentication, on: :collection
      end

      resources  :users

      resources  :schools, shallow: true do
        get :profile, on: :member

        resources :news
        resources :events
        resources :albums do
          get :pictures, on: :member
        end
      end

      resources :students do
        get :attendances, on: :member
        get :homework_dates, on: :member
        get :homework_details, on: :member
        get :profile, on: :member
      end

      resources :teachers do
        get :classes, on: :member
      end

      resources :staff_attendances

      resources :exams, only: [:index] do
        get :list, on: :member
      end

      resources :alerts, only: [:index, :show]
      resources :standards do
        get :subjects, on: :member
      end

    end
  end
end
