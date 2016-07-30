module ApplicationHelper

	# This helper method displays the hyphen in the
	# content_for helper method if there is a value
	# returned from content_for, otherwise the content_for
	# just displays "Flix" as the page title.
	def page_title
		if content_for?
			"Flix - #{content_for(:title)}"
		else
			"Flix"
		end
	end

end