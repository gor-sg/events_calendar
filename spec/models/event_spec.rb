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

RSpec.describe Event, type: :model do
  describe 'relations' do
    it { is_expected.to belong_to(:source).with_foreign_key('source_id') }
  end

  describe 'validations' do
    it do
      expect { create(:event, source: nil) }.to(
        raise_error(ActiveRecord::RecordInvalid, 'Validation failed: Source must exist')
      )
    end
  end

  describe 'not null constraints' do
    it { expect { create(:event) }.not_to raise_error }
    it { expect { create(:event, title: nil) }.to raise_error(ActiveRecord::NotNullViolation) }
    it { expect { create(:event, description: nil) }.to raise_error(ActiveRecord::NotNullViolation) }
    it { expect { create(:event, starts_on: nil) }.to raise_error(ActiveRecord::NotNullViolation) }
    it { expect { create(:event, ends_on: nil) }.to raise_error(ActiveRecord::NotNullViolation) }
  end

  describe 'uniqueness constraints' do
    let(:source) { create :source }
    let(:event_data) do
      { source: source,
        title: 'title',
        description: 'description',
        starts_on: Date.today,
        ends_on: Date.today }
    end

    before do
      Timecop.freeze
      Event.create!(event_data)
    end

    it { expect { Event.create!(event_data) }.to raise_error(ActiveRecord::RecordNotUnique) }
  end
end
