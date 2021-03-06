# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id          :bigint(8)        not null, primary key
#  source_id   :bigint(8)        not null
#  title       :string           not null
#  description :string           not null
#  starts_on   :date             not null
#  ends_on     :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ApplicationRecord
  belongs_to :source, foreign_key: 'source_id'

  def single?
    starts_on == ends_on
  end
end
