module Routes
  class Images < Cuba
    define do
      on post, param("image") do |image|
        job = Job.create
        image = ImageUploader.run(job, image)

        res.write(image.to_json)
      end
    end
  end
end
