json.array!(@generators) do |generator|
  json.extract! generator, :id, :name
  json.url generator_url(generator, format: :json)
end
