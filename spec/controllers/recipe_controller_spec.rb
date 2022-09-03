require 'rails_helper'

RSpec.describe "Recipes", type: :request do
  def setup
    @controller = RecipesController.new
  end
  let (:user) { User.create(name: 'Daniel', email: 'daniel@gmail.com') }
  before do 
    sign_in(user)
    user.confirm
  end

  describe "GET public_recipes" do
    before(:each) do
      get root_path
    end

    it "works! (now write some real specs)" do
      expect(response).to have_http_status(200)
    end

    it 'should contain the correct placeholder text in the body' do
      expect(response.body).to include('Public Recipes')
    end
  end
end
