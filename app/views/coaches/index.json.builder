json.array!(@coaches) do |coach|
  json.extract! coach, :id, :role, :name, :image_url, :description
  json.url coach_url(coach, format: :json)
end