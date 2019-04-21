# frozen_string_literal: true

describe 'index action', type: :feature do
  describe 'open page without parameters' do
    let!(:target_event) { create :event, starts_on: Date.today, ends_on: Date.tomorrow }

    it do
      visit root_url

      expect(current_url).to eq(root_url)
      expect(page).to have_selector('form')
      expect(page).to have_selector('.card-header', text: "#{Date.today} - #{Date.tomorrow}")
      expect(page).to have_selector('.card-title', text: target_event.title)
      expect(page).to have_selector('.card-text', text: target_event.description)
      expect(page).to have_selector('.card-text .text-muted', text: target_event.source.name)
    end
  end

  describe 'filter by source' do
    let!(:target_source) { create :source }
    let!(:target_event) { create :event, source: target_source }
    let!(:another_source) { create :source }
    let!(:another_event) { create :event, source: another_source }

    it do
      visit root_url
      select(target_source.name, from: 'source')
      click_button 'Search'

      expect(page).to have_selector('.card-title', text: target_event.title)
      expect(page).not_to have_selector('.card-title', text: another_event.title)
    end
  end

  describe 'filter by starts_on' do
    let!(:target_event) { create :event, starts_on: Date.tomorrow }
    let!(:another_event) { create :event, starts_on: Date.today }

    it do
      visit root_url
      within('form') { fill_in 'starts_on', with: Date.tomorrow }
      click_button 'Search'

      expect(page).to have_selector('.card-title', text: target_event.title)
      expect(page).not_to have_selector('.card-title', text: another_event.title)
    end
  end

  describe 'filter by ends_on' do
    let!(:target_event) { create :event, starts_on: Date.tomorrow, ends_on: Date.tomorrow }
    let!(:another_event) { create :event, starts_on: Date.today, ends_on: Date.today }

    it do
      visit root_url
      within('form') do
        fill_in 'starts_on', with: Date.tomorrow
        fill_in 'ends_on', with: Date.tomorrow
      end
      click_button 'Search'

      expect(page).to have_selector('.card-title', text: target_event.title)
      expect(page).not_to have_selector('.card-title', text: another_event.title)
    end
  end

  describe 'filter by query' do
    let!(:target_event) { create :event, title: 'Target' }
    let!(:another_event) { create :event, title: 'Another' }

    it do
      visit root_url
      within('form') { fill_in 'query', with: 'targ' }
      click_button 'Search'

      expect(page).to have_selector('.card-title', text: target_event.title)
      expect(page).not_to have_selector('.card-title', text: another_event.title)
    end
  end
end
