class BerghainParserService < BaseParserService
  URL = 'http://berghain.de/events/'

  private

  def get_elements(page)
    page.css('div.col_teaser')
  end

  def date_and_title(e)
    e.css('h4 a')[0]['title'].titleize
  end

  def title(e)
    date_and_title(e).split(': ').last
  end

  def description(e)
    e.css('p')[0].text.strip
  end

  def date(e)
    date_and_title(e).split(': ').first.to_date
  end

  def date_start(e)
    date(e)
  end

  def date_end(e)
    date(e)
  end
end
