# frozen_string_literal: true

module AutoCommit
  module Command
    class Git
      class << self
        def commit(message, opts=nil)
          # TODO optsに テンプレートでcommit起動を含むか選択させる
          if message && opts.nil?
          # TODO defaultのmessageを渡す
          # https://stackoverflow.com/questions/3966714/how-can-i-change-the-default-comments-in-the-git-commit-message
            `git commit -m '#{message}'`
            exit! 0
          end

          `git commit -opts '#{message}'`
          exit! 0
        end

        def status(opts=nil)
          `git status #{opts}`
        end
      end
    end
  end
end
