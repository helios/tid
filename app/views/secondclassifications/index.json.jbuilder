json.array!(@secondclassifications) do |secondclassification|
  json.extract! secondclassification, :id, :name
  json.url secondclassification_url(secondclassification, format: :json)
end
