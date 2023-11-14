class ImageFacade
  def initialize
    @image = ImageService.new
  end

  def get_images(country)
    data = @image.get_images(country)

    data[:results].map do |image_data|
      Image.new(image_data)
    end
  end
end