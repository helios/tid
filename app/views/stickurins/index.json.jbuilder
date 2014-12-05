json.array!(@stickurins) do |stickurin|
  json.extract! stickurin, :id, :proteinuria,, :ematuria
  json.url stickurin_url(stickurin, format: :json)
end
