# frozen_string_literal: true

class AutoCommit
  class CLI
    class << self
      def execute(opts)
        operation = Operation.new
        messages = MessageList.new.read
        operation.select(messages) unless messages.empty?

        if operation.comfirm
          Git.commit(operation.selected_message, '-m')
          return exit 0! # TODO この辺いい感じにする
        end
        Git.commit(operation.selected_message)
      end
    end
  end
end
