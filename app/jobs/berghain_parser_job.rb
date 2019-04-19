# frozen_string_literal: true

class BerghainParserJob < ApplicationJob
  queue_as :parsers

  def perform
    BerghainParserService.perform
  end
end
