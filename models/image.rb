class Image < Imagery
  #LARGE_WIDTH = 450

  #def self.to_proc
    #proc { |id| new(id) }
  #end

  #def initialize(id = nil)
    #super(:image, id, {
      #thumb: ["118x70^", "118x70"],
      #grid:  ["300x>"],
      #large: ["450x>"],
      #small: ["220x161^", "220x161"]
    #})
  #end

  #if Settings::PHOTO_CDN
    #def url(file = :large)
      #"%s%s" % [Settings::PHOTO_CDN, super]
    #end
  #else
    #def url(file = :large)
      #super
    #end
  #end

  #def save(io, id = generate_id)
    #super
  #end

  #def generate_id
    #str = "%0.16d" % Ohm.redis.incr("Image:id")

    #File.join(str.scan(/\d{4}/))
  #end

  #def to_hash
    #{ id: id, thumb: url(:thumb), small: url(:small), large: url(:large) }
  #end

  #def to_json(*args)
    #to_hash.to_json(*args)
  #end

  #def width(file = :large)
    #dim(file)[0].to_i
  #end

  #def height(file = :large)
    #dim(file)[1].to_i
  #end

#private
  #def dim(file)
    ## Basically, width=nil, height=nil for non existent images.
    #return [] if not id

    #res = Cache.get(:Image, id, file) do

      #`#{Imagery::GM::IDENTIFY % path(file)}`
    #end

    #if res && res.match(/(\d+)x(\d+)/)
      #return $1, $2
    #end
  #end

  #def path(file = :large)
    #root(ext(file))
  #end
end
