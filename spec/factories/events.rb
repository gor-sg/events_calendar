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

FactoryBot.define do
  factory :event do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    starts_on { Date.today }
    ends_on { Date.today + rand(7).days }
    source
  end
end
