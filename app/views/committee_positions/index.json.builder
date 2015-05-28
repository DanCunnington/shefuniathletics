json.array!(@committee_positions) do |committee_position|
  json.extract! committee_position, :id, :position, :name, :image_url, :description
  json.url committee_position_url(committee_position, format: :json)
end