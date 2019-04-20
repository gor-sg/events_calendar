# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @sources = Source.pluck(:name)

    prepare_filters

    @events = Event.joins(:source).order(starts_on: :asc)
    @events.where!('starts_on >= ?', @starts_on)
    @events.where!('ends_on <= ?', @ends_on)
    @events.where!(sources: { name: @source }) if @source
    @events.where!('title ilike ?', "%#{@query}%") if @query
  end

  private

  def prepare_filters
    @starts_on = params[:starts_on].to_date if params[:starts_on].present?
    @starts_on = Date.today if @starts_on.nil? || @starts_on.past?

    @ends_on = params[:ends_on].to_date if params[:ends_on].present?
    @ends_on ||= Date.today + 7.days if @ends_on.nil? || @ends_on.past?

    @starts_on, @ends_on = @ends_on, @starts_on if @starts_on > @ends_on

    @source = params[:source] if params[:source].present?
    @query = params[:query] if params[:query].present?
  end
end
