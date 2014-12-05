json.array!(@docs) do |doc|
  json.extract! doc, :id, :title, :operator, :date
  json.url doc_url(doc, format: :json)
end
