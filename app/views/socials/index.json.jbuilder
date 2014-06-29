json.array!(@socials) do |social|
  json.extract! social, :id, :name, :date, :facebook_event_link
  json.url social_url(social, format: :json)
end
