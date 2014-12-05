json.array!(@gradings) do |grading|
  json.extract! grading, :id, :name
  json.url grading_url(grading, format: :json)
end
