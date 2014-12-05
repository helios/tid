json.array!(@microrna_patients) do |microrna_patient|
  json.extract! microrna_patient, :id, :name, :surname, :datebirth, :gender, :addpain, :artalgia, :artrite, :more, :urin, :stick, :microrna, :dna
  json.url microrna_patient_url(microrna_patient, format: :json)
end
