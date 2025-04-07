# frozen_string_literal: true

module Clients
  # :nodoc:
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_client
    layout 'user'

    private

    def authenticate_client
      redirect_to root_path unless current_user.client?
    end
  end
end
