# frozen_string_literal: true

RSpec.describe BerghainParserService do
  let(:test_source) { create :source }
  let(:test_content) do
    <<-TEST_CONTENT
      <div class="col col_teaser col_teaser_type_stage marker">
        <h4 class="type_stage">
          <span>
            <a href="/event/2752" title="Tue 30 April 2019: Event Title">
            Tue 30 Apr 2019         <span style="margin-left: -20px; display: block;">Event Title</span>
            </a>
          </span>
        </h4>
        <p class="type_stage_color">
          <span>
            Event Description
          </span>
        </p>
      </div>
    TEST_CONTENT
  end

  before { allow_any_instance_of(described_class).to receive(:page_content).and_return(test_content) }

  it { expect { described_class.perform }.to change(Source, :count).by(1) }
  it { expect { described_class.perform }.to change(Event, :count).by(1) }

  it do
    allow_any_instance_of(described_class).to receive(:source).and_return(test_source)

    expect(Event).to receive(:create!).with(
      source: test_source,
      title: 'Event Title',
      description: 'Event Description',
      starts_on: Date.new(2019, 4, 30),
      ends_on: Date.new(2019, 4, 30)
    )
    described_class.perform
  end
end
