class Block

  def initialize(arr)
    @width = arr[0]
    @length = arr[1]
    @height = arr[2]
  end

  def get_width
    @width
  end

  def get_length
    @length
  end

  def get_height
    @height
  end

  def get_volume
    @width * @length * @height
  end

  def get_surface_area
    2 * ( @width * @length + @width * @height + @height * @length )
  end

end
