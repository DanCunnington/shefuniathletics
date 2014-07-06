json.array!(@male_outdoors) do |record|
  json.extract! record, :event, :event_type, :athlete, :time, :competition
  json.url record_url(record, format: :json)
end

json.array!(@male_indoors) do |record|
  json.extract! record, :event, :event_type, :athlete, :time, :competition
  json.url record_url(record, format: :json)
end

json.array!(@female_outdoors) do |record|
  json.extract! record, :event, :event_type, :athlete, :time, :competition
  json.url record_url(record, format: :json)
end

json.array!(@female_indoors) do |record|
  json.extract! record, :event, :event_type, :athlete, :time, :competition
  json.url record_url(record, format: :json)
end
