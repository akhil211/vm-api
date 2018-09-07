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
      end

    end
  end
end
