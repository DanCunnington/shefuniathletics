json.array!(@fixtures) do |fixture|
  json.extract! fixture, :id, :name, :date, :location, :result_link
  json.url fixture_url(fixture, format: :json)
end
