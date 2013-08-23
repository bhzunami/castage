module StaticPagesHelper

	def image_path(image)
		"gallery/#{@category_path}/#{image.split('/').last}"
	end
end
