module Routes
  class Images < Cuba
    define do
      on post, param("image") do |dict|
        i = Imagery.new(:image)
        i.save(dict[:tempfile])
      end
    end
  end
end
