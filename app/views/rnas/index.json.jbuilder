json.array!(@rnas) do |rna|
  json.extract! rna, :id, :date, :comment
  json.url rna_url(rna, format: :json)
end
