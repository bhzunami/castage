module ApplicationHelper

	# Returns the full title on a per-page basis.
	def full_title( page_title )
		base_title = "Ferienhaus vor Weissenfluh"

		return "#{base_title} | #{page_title}" unless page_title.empty?
		return base_title
	end

end
