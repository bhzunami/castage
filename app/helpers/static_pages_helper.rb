module StaticPagesHelper

	def image_path(image)
		"gallery/#{@category_path}/#{image.split('/').last}"
	end

	def category_image(category)
		images = Dir.glob("app/assets/images/gallery/#{category}/*_tb*")
		image_path_with_category(images.first, category)
	end

		def image_path_with_category(image, category)
		"gallery/#{category}/#{image.split('/').last}"
	end

	def category_name(categorie)
		categorie.split('/').last
	end

	def get_original(image)
		image_path(image).gsub!(/_([a-z]+).jpg/, '_og.jpg')
	end

	def get_image_name(image)
		image = image_path(image).gsub!(/_([a-z]+).jpg/, '')
		File.basename(image, 'jpg')
	end
end
