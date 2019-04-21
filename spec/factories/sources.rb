# frozen_string_literal: true

# == Schema Information
#
# Table name: sources
#
#  id   :bigint(8)        not null, primary key
#  name :string           not null
#

FactoryBot.define do
  factory :source do
    name { Faker::Internet.domain_name }
  end
end
