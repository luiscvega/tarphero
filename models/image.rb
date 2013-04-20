class Image < Imagery
  self.root = File.join(Dir.pwd, "public")

  def initialize
    super(:images, Ohm.redis.incr("Image:id"))
  end

  def to_hash
    { id: key, url: url, orientation: orientation, width: width, height: height, ratio: ratio }
  end

  def to_json(*args)
    to_hash.to_json(*args)
  end

  def width
    (@width ||= dim[0]).to_i
  end

  def height
    (@height ||= dim[1]).to_i
  end

  def ratio
    width.to_f / height.to_f
  end

  def orientation
    width > height ? "landscape" : "portrait"
  end

  def dim
    return [@width, @height] if @width && @height

    info = `#{GM::IDENTIFY % File.join("public", url)}`
    info.match(/(\d+)x(\d+)/)
    @width, @height = $1, $2
  end

end
