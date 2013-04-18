class ImageUploader
  def self.run(job, images)
    job.image_ids ||= []

    ret = []

    images.each do |dict|
      image = Image.new
      image.save(dict[:tempfile])

      ret << image
    end

    job.image_ids += ret.map { |e| e.key }
    job.save

    return ret
  end
end
