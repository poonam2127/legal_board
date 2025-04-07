# frozen_string_literal: true

# :nodoc:
module Loggable
  def log_info(message)
    Rails.logger.info ":::#{message}:::"
  end
end
