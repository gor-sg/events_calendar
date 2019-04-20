# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    # TODO: Move sources to separate table
    @sources = Source.pluck(:name)

    prepare_filters

    @events = Event.joins(:source).order(date_start: :asc)
    @events.where!('date_start >= ?', @date_start)
    @events.where!('date_end <= ?', @date_end)
    @events.where!(sources: { name: @source }) if @source
    @events.where!('title ilike ?', "%#{@query}%") if @query
  end

  private

  def prepare_filters
    @date_start = params[:date_start].to_date if params[:date_start].present?
    @date_start ||= Date.today

    @date_end = params[:date_end].to_date if params[:date_end].present?
    @date_end ||= Date.today + 7.days

    @date_start, @date_end = @date_end, @date_start if @date_start > @date_end

    @source = params[:source] if params[:source].present?
    @query = params[:query] if params[:query].present?
  end
end
