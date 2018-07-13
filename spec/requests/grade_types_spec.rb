require 'rails_helper'

RSpec.describe "GradeTypes", type: :request do
  describe "GET /grade_types" do
    it "works! (now write some real specs)" do
      get grade_types_path
      expect(response).to have_http_status(200)
    end
  end
end
