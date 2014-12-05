json.array!(@cells) do |cell|
  json.extract! cell, :id, :label
  json.url cell_url(cell, format: :json)
end
