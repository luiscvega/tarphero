class ImageUploader
  def self.run(job, upload)
    job.image_ids ||= []

    image = Image.new
    image.save(upload[:tempfile])

    job.image_ids << image.key
    job.save

    return image
  end
end
