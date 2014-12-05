json.array!(@modello1s) do |modello1|
  json.extract! modello1, :id, :first, :name
  json.url modello1_url(modello1, format: :json)
end
