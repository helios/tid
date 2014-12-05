json.array!(@tprimarytumors) do |tprimarytumor|
  json.extract! tprimarytumor, :id, :name
  json.url tprimarytumor_url(tprimarytumor, format: :json)
end
