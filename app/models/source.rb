# frozen_string_literal: true

# == Schema Information
#
# Table name: sources
#
#  id   :bigint(8)        not null, primary key
#  name :string           not null
#

class Source < ApplicationRecord
  has_many :events
end
