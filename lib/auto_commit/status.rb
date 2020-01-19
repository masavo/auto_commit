# frozen_string_literal: true
require 'ostruct'

class AutoCommit
  class Status

    attr_reader :type, :word

    def initialize(type)
      @type = types[type]
      @word = words[type]
    end

    private

    def types
      # referenced
      # https://git-scm.com/docs/git-status
      OpenStruct.new(
        M: :modified,
        A: :added,
        D: :deleted,
        R: :renamed,
        C: :copied,
        U: :updated_but_unmerged,
      )
    end

    def words
      OpenStruct.new(
        M: 'Update',
        A: 'Add',
        D: 'Delete',
        R: 'Rename',
        C: 'Copy',
        U: 'UpdatedButUnmerged',
      )
    end
  end
end
