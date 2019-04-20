# frozen_string_literal: true

class CoBerlinParserService < BaseParserService
  URL = 'https://www.co-berlin.org/en/calender'

  private

  def get_elements(page)
    page.css('div.seite-c-single')
  end

  def title(element)
    element.css('.article-title').text
  end

  def description(element)
    element.css('.article-text').text
  end

  def start_date(element)
    return single_date(element) if single_event?(element)

    element.css('.date-display-start')[0]['content'].to_date
  end

  def end_date(element)
    return single_date(element) if single_event?(element)

    element.css('.date-display-end')[0]['content'].to_date
  end

  def single_date(element)
    element.css('.date-display-single')[0]['content'].to_date
  end

  def single_event?(element)
    element.css('.date-display-range').empty?
  end
end
