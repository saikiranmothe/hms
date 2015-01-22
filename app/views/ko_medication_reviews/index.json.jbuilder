json.array!(@ko_medication_reviews) do |ko_medication_review|
  json.extract! ko_medication_review, :id, :title, :description, :user_id, :is_anonymous, :rating, :condition_id
  json.url ko_medication_review_url(ko_medication_review, format: :json)
end
