# frozen_string_literal: true

module Users
  # :nodoc:
  class RegistrationsController < Devise::RegistrationsController
    def create
      build_resource(registration_params)
      if resource.save
        redirect_to new_user_session_path
      else
        flash[:alert] = 'Please fill correct data.'
        respond_with resource, location: new_user_registration_path
      end
    end

    private

    def registration_params
      params.require(:user).permit(
        :name, :email, :password, :password_confirmation
      )
    end
  end
end
