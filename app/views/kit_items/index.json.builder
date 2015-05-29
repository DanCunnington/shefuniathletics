json.array!(@kit_items) do |kit_item|
  json.extract! kit_item, :id, :name, :image_url, :url
  json.url kit_item_url(kit_item, format: :json)
end