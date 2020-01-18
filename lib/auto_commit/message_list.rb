# frozen_string_literal: true

class AutoCommit
  class MessageList
    def initialize
      @messages = get_messages
    end

    # @return [Array]
    def read
      @messages
    end

    private

    # @return [Array<Message>]
    def get_messages
     staging_files.map {|file| make_message(file) }
    end

    # @return [Array<StagingFile>]
    def staging_files
      StagingFileList.new.read
    end

    # @return [Message]
    def make_message(file)
       Message.new(file)
    end
  end
end
