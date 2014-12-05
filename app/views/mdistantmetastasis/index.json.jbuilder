json.array!(@mdistantmetastasis) do |mdistantmetastasi|
  json.extract! mdistantmetastasi, :id, :name
  json.url mdistantmetastasis_url(mdistantmetastasi, format: :json)
end
