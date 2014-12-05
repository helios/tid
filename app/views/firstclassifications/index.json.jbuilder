json.array!(@firstclassifications) do |firstclassification|
  json.extract! firstclassification, :id, :name
  json.url firstclassification_url(firstclassification, format: :json)
end
