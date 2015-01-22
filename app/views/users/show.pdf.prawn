prawn_document() do |pdf|
	pdf.text "HealthBase - Profile"
	pdf.text @user.full_name
end	