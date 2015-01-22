module ApplicationHelper
	def status_document_link(status)
		if status.document && status.document.attachment?
			content_tag(:span, "Attachment", class: "label label-info") +
			link_to(status.document.attachment_file_name, status.document.attachment.url)
		end
	end

	def avatar_profile_link(user, image_options={}, html_options={})
		avatar_url = user.avatar? ? user.avatar.url(:thumb) : nil
		link_to(image_tag(avatar_url, {height: 40, class: "img-circle"}), user_path(user), html_options)
	end

	def avatar_profile_link2(user, image_options={}, html_options={})
		avatar_url = user.avatar? ? user.avatar.url(:thumb) : nil
		link_to(image_tag(avatar_url, {height: 55, class: "img-circle pull-left", style: ""}), user_path(user), html_options)
	end

	def avatar_profile_link3(user, image_options={}, html_options={})
		avatar_url = user.avatar? ? user.avatar.url(:thumb) : nil
		link_to(image_tag(avatar_url, {height: 35, class: "img-circle pull-left", style: ""}), user_path(user), html_options)
	end

	def flash_class(type)
		case type
		when :alert
			"alert-error"
		when :notice
			"alert-primary"
		else
			""
		end
	end
end
