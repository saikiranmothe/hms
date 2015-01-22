json.array!(@ko_medications) do |ko_medication|
  json.extract! ko_medication, :id, :name, :description
  json.url ko_medication_url(ko_medication, format: :json)
end
