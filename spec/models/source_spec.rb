# frozen_string_literal: true

# == Schema Information
#
# Table name: sources
#
#  id   :bigint(8)        not null, primary key
#  name :string           not null
#

RSpec.describe Source, type: :model do
  describe 'relations' do
    it { is_expected.to have_many(:events) }
  end

  describe 'uniqueness constraints' do
    let(:trigger_event) { proc { Source.create!(name: 'Name') } }

    before { trigger_event.call }

    it { expect(trigger_event).to raise_error(ActiveRecord::RecordNotUnique) }
  end
end
