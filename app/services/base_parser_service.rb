# frozen_string_literal: true

class BaseParserService
  private_class_method :new

  def self.perform
    raise "Base class doesn't support perform!" unless const_defined? :URL

    new.process
  end

  def process
    content = Nokogiri::HTML(page_content)

    get_elements(content).each do |e|
      create_record(
        source: source,
        title: title(e),
        description: description(e),
        date_start: date_start(e),
        date_end: date_end(e)
      )
    end
    nil
  end

  private

  def page_content
    uri = URI(self.class::URL)

    Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new(uri)

      response = http.request(request)
      response.body
    end
  end

  def source
    @source ||= Source.find_or_create_by(name: source_host)
  end

  def source_host
    URI(self.class::URL).host
  end

  def create_record(data)
    ActiveRecord::Base.transaction do
      Event.create!(data) unless Event.find_by(data.slice(:source, :title, :date_start, :date_end))
    end
  end
end
