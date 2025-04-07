# frozen_string_literal: true

module Admin
  # :nodoc:
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin
    layout 'user'

    private

    def authenticate_admin
      redirect_to root_path unless current_user.admin?
    end
  end
end
