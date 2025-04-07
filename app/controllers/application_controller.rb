# frozen_string_literal: true

# :nodoc:
class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :success
  allow_browser versions: :modern
  protect_from_forgery with: :exception
end
