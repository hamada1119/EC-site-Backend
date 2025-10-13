# app/controllers/api/auth/sessions_controller.rb
module Api
  module Auth
    class SessionsController < Devise::SessionsController
      skip_before_action :verify_authenticity_token
      respond_to :json
      
      def create

        user = User.find_by(email: sign_in_params[:email])
        
        if user && user.valid_password?(sign_in_params[:password])
          sign_in(user)
          render json: {
            message: 'Logged in successfully',
            user: { id: user.id, email: user.email }
          }, status: :ok
        else
          render json: {
            message: 'Invalid email or password'
          }, status: :unauthorized
        end
      end
      
      private
      
      def sign_in_params
        params.require(:user).permit(:email, :password)
      end
      
      def respond_to_on_destroy
        render json: { message: 'Logged out successfully' }, status: :ok
      end
    end
  end
end