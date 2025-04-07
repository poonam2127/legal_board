# frozen_string_literal: true

module Lawyers
  # :nodoc:
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_lawyer
    layout 'user'

    private

    def authenticate_lawyer
      redirect_to root_path unless current_user.lawyer?
    end
  end
end
