class BaseParserService
  def perform
    content = Nokogiri::HTML(page_content)

    puts get_elements(content).count

    get_elements(content).each do |e|
      data = {
        title: title(e),
        description: description(e),
        date_start: date_start(e),
        date_end: date_end(e),
      }

      create_record(data)
    end
    nil
  end

  private

  def page_content
    uri = URI(self.class::URL)

    body = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
      request = Net::HTTP::Get.new(uri)

      response = http.request(request)
      response.body
    end
  end

  def source
    URI(self.class::URL).host
  end

  def create_record(data)
    ActiveRecord::Base.transaction do
      unless Event.find_by(data.slice(:title, :date_start, :date_end).merge(source: source))
        Event.create(data.merge(source: source))
      end
    end
  end
end
