json.array!(@rec_run_routes) do |rec_run_route|
  json.extract! rec_run_route, :id, :name, :distance, :difficulty, :description, :google_maps_link
  json.url fixture_url(rec_run_route, format: :json)
end
