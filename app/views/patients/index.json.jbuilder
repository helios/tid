json.array!(@patients) do |patient|
  json.extract! patient, :id, :histology_number, :patient_id, :date_of_birth, :gender, :smoker, :date_of_biopsy, :distance
  json.url patient_url(patient, format: :json)
end
