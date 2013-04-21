module Routes
  class Jobs < Cuba
    define do
      on "new" do
        render "jobs/new", {}, "layouts/layout"
      end

      on post, param("job") do |dict|
        raise dict.inspect
      end
    end
  end
end
