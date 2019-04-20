# frozen_string_literal: true

# == Schema Information
#
# Table name: events
#
#  id          :bigint(8)        not null, primary key
#  title       :string           not null
#  description :string           not null
#  source      :string           not null
#  date_start  :date             not null
#  date_end    :date             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Event < ApplicationRecord
  def single?
    date_start == date_end
  end
end
