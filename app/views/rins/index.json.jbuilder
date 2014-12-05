json.array!(@rins) do |rin|
  json.extract! rin, :id, :measure, :date
  json.url rin_url(rin, format: :json)
end
