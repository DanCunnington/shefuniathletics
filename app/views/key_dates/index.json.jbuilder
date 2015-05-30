json.array!(@key_dates) do |key_date|
  json.extract! key_date, :id, :description
  json.url key_date_url(key_date, format: :json)
end
