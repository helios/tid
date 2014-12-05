json.array!(@sample_sheets) do |sample_sheet|
  json.extract! sample_sheet, :id, :fcid, :lane, :sampleId, :sampleRef, :index, :description, :control, :receipe, :operator, :sampleProject
  json.url sample_sheet_url(sample_sheet, format: :json)
end
