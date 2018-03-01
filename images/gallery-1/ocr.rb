	require 'rubygems'
	require 'rmagick'

    img = Magick::Image::read('20735925.jpg').first

	# Your mileage will vary with this following method; we ended up just using a Photoshop batch job to correctly produce a 
	# black-and-white version
	img = img.sigmoidal_contrast_channel(5,40,true).quantize(16, Magick::GRAYColorspace).posterize(5)

	# write out the result just to see what it looks like
    img.write('_20735925.jpg'){|f| f.depth = 8}
	# the block sets the saved image to a depth of 8-bits

