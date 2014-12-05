json.array!(@nregionallymphnodes) do |nregionallymphnode|
  json.extract! nregionallymphnode, :id, :name
  json.url nregionallymphnode_url(nregionallymphnode, format: :json)
end
