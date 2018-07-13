require 'rails_helper'

RSpec.describe "UserHasExams", type: :request do
  describe "GET /user_has_exams" do
    it "works! (now write some real specs)" do
      get user_has_exams_path
      expect(response).to have_http_status(200)
    end
  end
end
