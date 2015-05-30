json.array!(@historic_images) do |historic_image|
  json.extract! historic_image, :image_url
  json.url historic_image_url(historic_image, format: :json)
end