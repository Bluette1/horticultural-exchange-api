require "rails_helper"

RSpec.describe Admin::UsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admin/users").to route_to("admin/users#index")
    end

    it "routes to #create" do
      expect(post: "/admin/users").to route_to("admin/users#create")
    end

    it "routes to #destroy" do
      expect(delete: "/admin/users/1").to route_to("admin/users#destroy", id: "1")
    end
  end
end
