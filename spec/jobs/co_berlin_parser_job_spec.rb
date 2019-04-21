# frozen_string_literal: true

RSpec.describe CoBerlinParserJob, type: :job do
  before { ActiveJob::Base.queue_adapter = :test }

  describe '#perform_later' do
    it { expect { CoBerlinParserJob.perform_later }.to have_enqueued_job.on_queue('parsers') }
  end
end
