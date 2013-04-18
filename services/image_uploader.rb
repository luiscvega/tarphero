class ImageUploader
  def self.run(job, photos)
    job.image_ids ||= []

    ret = []

    photos.each do |dict|
      photo = Image.new(:image, 1)
      photo.save(dict[:tempfile])

      ret << photo
    end

    job.photo_ids += ret.map { |e| e.id }
    job.save

    return ret
  end
end
