class Image < Imagery
  self.root = File.join(Dir.pwd, "public")

  def initialize
    super(:images, Ohm.redis.incr("Image:id"))
  end

  def to_hash
    { id: key }
  end
end
