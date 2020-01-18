# frozen_string_literal: true

class AutoCommit
  class StagingFileList
    def initialize
      # TODO initialize なしverもあり
      @staging_files = staging_files
    end

    def read
      @staging_files
    end

    private

    # @return [Array<Hash>]
    def staging_files
      @staging_files  ||=
        reject_unstaged(stdouts)
        .map { |line| StagingFile.new(line) }
    end

    # @return [String]
    def stdouts
      Git.status('--porcelain').split("\n")
    end

    def reject_unsteged
      .reject { |line| line.match(/^(\?\?)|( )/) }
    end
  end
end
