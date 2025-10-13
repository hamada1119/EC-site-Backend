# app/controllers/api/auth/registrations_controller.rb
module Api
  module Auth
    class RegistrationsController < Devise::RegistrationsController
      skip_before_action :verify_authenticity_token
      respond_to :json
      
      def create
        user = User.new(sign_up_params)
        
        if user.save
          render json: {
            message: 'Signed up successfully',
            user: { id: user.id, email: user.email }
          }, status: :ok
        else
          render json: {
            message: 'User could not be created',
            errors: user.errors.full_messages
          }, status: :unprocessable_entity
        end
      end
      
      private
      
      def sign_up_params
        params.require(:user).permit(:email, :password, :password_confirmation)
      end
    end
  end
end