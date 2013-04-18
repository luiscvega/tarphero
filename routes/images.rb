module Routes
  class Images < Cuba
    define do
      on post, param("images") do |images|
        job = Job.create
        images = ImageUploader.run(job, images)

        res.write({ images: images }.to_json)
      end
    end
  end
end
