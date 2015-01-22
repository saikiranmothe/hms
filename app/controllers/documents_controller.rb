class DocumentsController < ApplicationController
	private

	def document_params
		params.require(:document).permit(:attachment, :remove_attachment)
	end
end
