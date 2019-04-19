# frozen_string_literal: true

class BerghainParserService < BaseParserService
  URL = 'http://berghain.de/events/'

  private

  def get_elements(page)
    page.css('div.col_teaser')
  end

  def date_and_title(element)
    element.css('h4 a')[0]['title'].titleize
  end

  def title(element)
    date_and_title(element).split(': ').last
  end

  def description(element)
    element.css('p')[0].text.strip
  end

  def date(element)
    date_and_title(element).split(': ').first.to_date
  end

  def date_start(element)
    date(element)
  end

  def date_end(element)
    date(element)
  end
end
