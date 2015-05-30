json.array!(@events) do |event|
  json.extract! event, :description
  json.url event_url(event, format: :json)
end