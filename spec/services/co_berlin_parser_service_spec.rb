# frozen_string_literal: true

RSpec.describe CoBerlinParserService do
  context 'single_date' do
    let(:test_source) { create :source }
    let(:test_content) do
      <<-TEST_CONTENT
        <div class="seite-c-single">
          <a href="/en/cortis-sonderegger">
            <div class="calender-image">
              <img typeof="foaf:Image" src="https://www.co-berlin.org/sites/default/files/styles/calender/public/article/headerimages/00_making-of-as11-40-5878_web.jpg?itok=hLMYFmZz" width="1440" height="960" alt="">
              <div class="copyright">Making of „AS11-40-5878“ (by Edwin Aldrin, 1969), 2014 © Jojakim Cortis &amp; Adrian Sonderegger</div>
            </div>
          </a>
          <div class="calender-text">
            <a href="/en/cortis-sonderegger">
              <div class="article-over-title">
                <span class="article-category">Exhibitions</span>
                <span class="article-date">
                  <span class="date-display-single" property="dc:date" datatype="xsd:dateTime" content="2019-04-25T00:00:00+02:00">25/04/19</span>
                </span>
              </div>
              <div class="article-title">Event Title</div>
              <div class="article-subtitle"></div>
              <div class="article-text">Event Description</div>
            </a>
            <div class="more">
              <a href="/en/cortis-sonderegger"></a>
              <a href="/en/cortis-sonderegger" title="Cortis &amp; Sonderegger">more</a>
            </div>
          </div>
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
        starts_on: Date.new(2019, 4, 25),
        ends_on: Date.new(2019, 4, 25)
      )
      described_class.perform
    end
  end

  context 'multy_date' do
    let(:test_source) { create :source }
    let(:test_content) do
      <<-TEST_CONTENT
        <div class="seite-c-single">
          <a href="/en/cortis-sonderegger">
            <div class="calender-image">
              <img typeof="foaf:Image" src="https://www.co-berlin.org/sites/default/files/styles/calender/public/article/headerimages/00_making-of-as11-40-5878_web.jpg?itok=hLMYFmZz" width="1440" height="960" alt="">
              <div class="copyright">Making of „AS11-40-5878“ (by Edwin Aldrin, 1969), 2014 © Jojakim Cortis &amp; Adrian Sonderegger</div>
            </div>
          </a>
          <div class="calender-text">
            <a href="/en/cortis-sonderegger">
              <div class="article-over-title">
                <span class="article-category">Exhibitions</span>
                <span class="article-date">
                  <div class="date-display-range">
                    <span class="date-display-start" property="dc:date" datatype="xsd:dateTime" content="2019-03-16T00:00:00+01:00">16/03/19</span> to <span class="date-display-end" property="dc:date" datatype="xsd:dateTime" content="2019-06-01T00:00:00+02:00">01/06/19</span>
                  </div>
                </span>
              </div>
              <div class="article-title">Event Title</div>
              <div class="article-subtitle"></div>
              <div class="article-text">Event Description</div>
            </a>
            <div class="more">
              <a href="/en/cortis-sonderegger"></a>
              <a href="/en/cortis-sonderegger" title="Cortis &amp; Sonderegger">more</a>
            </div>
          </div>
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
        starts_on: Date.new(2019, 3, 16),
        ends_on: Date.new(2019, 6, 1)
      )
      described_class.perform
    end
  end
end
