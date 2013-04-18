class Image < Imagery
  self.root = File.join(Dir.pwd, "public")

  def initialize
    super(:images, Ohm.redis.incr("Image:id"))
  end

  def to_hash
    { id: key }
  end

  def to_json(*args)
    to_hash.to_json(*args)
  end

end
