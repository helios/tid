json.array!(@pathologicalurins) do |pathologicalurin|
  json.extract! pathologicalurin, :id, :proteinuria, :creatinuria, :ratio, :ematuria
  json.url pathologicalurin_url(pathologicalurin, format: :json)
end
