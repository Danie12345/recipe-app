require 'rails_helper'

RSpec.describe 'Foods Controller', type: :request do
  def setup
    @controller = FoodsController.new
  end
  let(:user) { User.create(name: 'Daniel', email: 'daniel@gmail.com') }
  before do
    sign_in(user)
    user.confirm
  end

  describe 'GET foods' do
    before(:each) do
      get foods_path
    end

    it 'works! (now write some real specs)' do
      expect(response).to have_http_status(200)
    end

    it 'should contain the correct placeholder text in the body' do
      expect(response.body).to include('Add Food')
    end
  end
end
