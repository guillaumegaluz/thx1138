require 'spec_helper'

describe ShootingsController do
  describe 'GET #show' do
    it "returns the shootings for a given movie" do
      get :show, :id => 1

      puts last_response
      # expect(response.body).to match /#map-canvas/
    end
  end
end
