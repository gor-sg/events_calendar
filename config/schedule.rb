# frozen_string_literal: true

set :output, 'log/whenever.log'

every 1.hour do
  runner 'BerghainParserJob.perform_later'
end

every 1.hour do
  runner 'CoBerlinParserJob.perform_later'
end
