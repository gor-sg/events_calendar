class CoBerlinParserService < BaseParserService
  URL = 'https://www.co-berlin.org/en/calender'

  private

  def get_elements(page)
    page.css('div.seite-c-single')
  end

  def title(e)
    e.css('.article-title').text
  end

  def description(e)
    e.css('.article-text').text
  end

  def date_start(e)
    return date_single(e) if single_event?(e)

    e.css('.date-display-start')[0]['content'].to_date
  end

  def date_end(e)
    return date_single(e) if single_event?(e)

    e.css('.date-display-end')[0]['content'].to_date
  end

  def date_single(e)
    e.css('.date-display-single')[0]['content'].to_date
  end

  def single_event?(e)
    e.css('.date-display-range').empty?
  end
end
