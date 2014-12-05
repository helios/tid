json.array!(@rna_forms) do |rna_form|
  json.extract! rna_form, :id, :sortingDate, :noCells, :cell_id, :noAliquots, :cellsPerAliquot, :purity, :volBufferPerAliquot, :noAliquotsRnaIsolation, :rnaIsolationDate, :rnaId, :volDilution, :rnaConc, :totalCells, :ngTotal, :ngUsed, :ngRemaining, :operator, :sampleIndex, :sampleId
  json.url rna_form_url(rna_form, format: :json)
end
