json.array!(@addresses) do |address|
  json.extract! address, :id, :street, :number, :model11_name
  json.url address_url(address, format: :json)
end
