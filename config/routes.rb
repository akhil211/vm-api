Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    # Version 1 Api routes
    namespace :v1 do
      resource  :tokens, only: [:create] do
        post :request_otp, on: :collection
        post :mobile_authentication, on: :collection
      end

      resource  :users, only: [] do
        get :profile, on: :collection
        get :school_profile, on: :collection
      end

      resources :students do
        get :attendances, on: :member
        get :homework_dates, on: :member
        get :homework_details, on: :member
      end

      resources :exams, only: [:index] do
        get :list, on: :member
      end

    end
  end
end
