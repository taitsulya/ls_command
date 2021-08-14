# frozen_string_literal: true

require 'colorize'
require_relative 'ls_command/version'

module LsCommand
  class Error < StandardError; end

  def self.ls
    current_dir = Dir.pwd
    Dir.children(current_dir).map do |entry|
      if entry[0] == '.'
        entry.light_black
      elsif File.directory? File.join(current_dir, entry)
        entry.blue
      else
        entry.white
      end
    end
  end
end
