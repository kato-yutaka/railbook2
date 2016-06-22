json.array!(@publishes) do |publish|
  json.extract! publish, :id, :publishname, :Address
  json.url publish_url(publish, format: :json)
end
