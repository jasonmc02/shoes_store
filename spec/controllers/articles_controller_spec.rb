require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  render_views
  before do 
    @store = create(:store)
    article = create(:article, :store => @store)
  end
  it "Returns an json object with all the articles" do
    get :services_filter, { "format" => "json", "username" => "my_user", "password" => "my_password" }
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)).not_to be_empty
    expect(JSON.parse(response.body)["success"]).to eq(true)
  end
end
