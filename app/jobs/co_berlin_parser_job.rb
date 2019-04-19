# frozen_string_literal: true

class CoBerlinParserJob < ApplicationJob
  queue_as :parsers

  def perform
    CoBerlinParserJob.perform
  end
end
