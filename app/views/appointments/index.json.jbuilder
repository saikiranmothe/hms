json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :user_id, :specialist_id, :name, :notes, :start_date, :end_date, :location
  json.url appointment_url(appointment, format: :json)
end
