module Routes
  class Jobs < Cuba
    define do
      on "new" do
        render "jobs/new", {}, "layouts/layout"
      end
    end
  end
end
