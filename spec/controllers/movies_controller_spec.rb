require 'spec_helper'

describe MoviesController do
  describe 'GET #index' do
    render_views
    it "renders the main elements of the page" do
      get :index

      expect(response.body).to match /map-canvas/
      expect(response.body).to match /main-wrapper/
    end
  end
end
