json.array!(@model1s) do |model1|
  json.extract! model1, :id, :name, :surname
  json.url model1_url(model1, format: :json)
end
