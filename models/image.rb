class Image < Imagery
  self.root = File.join(Dir.pwd, "public")

  def initialize
    super(:images, Ohm.redis.incr("Image:id"))
  end

  def to_hash
    { id: key, url: url, orientation: orientation, width: width, height: height }
  end

  def to_json(*args)
    to_hash.to_json(*args)
  end

  def width
    @width ||= dim[0]
  end

  def height
    @height ||= dim[1]
  end

  def orientation
    width.to_i > height.to_i ? "landscape" : "portrait"
  end

  def dim
    return [@width, @height] if @width && @height

    info = `#{GM::IDENTIFY % File.join("public", url)}`
    info.match(/(\d+)x(\d+)/)
    @width, @height = $1, $2
  end

end
