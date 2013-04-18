module Routes
  class Images < Cuba
    define do
      on post, param("images") do |photos|
        job = Job.create
        binding.pry
        photos = ImageUploader.run(job, photos)

        res.write({ photos: photos }.to_json)
      end
    end
  end
end
