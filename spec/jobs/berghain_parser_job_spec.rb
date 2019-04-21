# frozen_string_literal: true

RSpec.describe BerghainParserJob, type: :job do
  before { ActiveJob::Base.queue_adapter = :test }

  describe '#perform_later' do
    it { expect { BerghainParserJob.perform_later }.to have_enqueued_job.on_queue('parsers') }
  end
end
