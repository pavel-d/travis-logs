# frozen_string_literal: true

require 'travis/logs'
require 'travis/exceptions'

module Travis
  module Logs
    class SendTimings
      def setup
        Travis.logger.info('Starting Timing Sender')
        Travis::Logs::Sidekiq.setup
      end

      def run(log_id)
        Travis::Logs::Services::SendTimings.new(log_id).run
      end
    end
  end
end
