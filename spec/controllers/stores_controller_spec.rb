require 'rails_helper'

RSpec.describe StoresController, type: :controller do
  render_views
  before do 
    @store = create(:store)
    article = create(:article, :store => @store)
  end
  it "Returns an json object with the articles from a store" do
    get :services_filter, { "format" => "json", "id" => @store.id, "username" => "my_user", "password" => "my_password" }
    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)).not_to be_empty
    expect(JSON.parse(response.body)["success"]).to eq(true)
  end
  it "Returns unauthorized" do
    get :services_filter, { "format" => "json", "id" => @store.id }
    expect(response.status).to eq(401)
    expect(JSON.parse(response.body)).not_to be_empty
    expect(JSON.parse(response.body)["success"]).to eq(false)
  end
  it "Returns unauthorized" do
    get :services_filter, { "format" => "json", "id" => @store.id, "username" => "", "password" => "" }
    expect(response.status).to eq(401)
    expect(JSON.parse(response.body)).not_to be_empty
    expect(JSON.parse(response.body)["success"]).to eq(false)
  end
  it "Returns unauthorized" do
    get :services_filter, { "format" => "json", "id" => @store.id, "username" => "my_user" }
    expect(response.status).to eq(401)
    expect(JSON.parse(response.body)).not_to be_empty
    expect(JSON.parse(response.body)["success"]).to eq(false)
  end
  it "Returns unauthorized" do
    get :services_filter, { "format" => "json", "id" => @store.id, "password" => "my_password" }
    expect(response.status).to eq(401)
    expect(JSON.parse(response.body)).not_to be_empty
    expect(JSON.parse(response.body)["success"]).to eq(false)
  end
  it "Returns unauthorized" do
    get :services_filter, { "format" => "json", "id" => @store.id, "username" => "my_user", "password" => "" }
    expect(response.status).to eq(401)
    expect(JSON.parse(response.body)).not_to be_empty
    expect(JSON.parse(response.body)["success"]).to eq(false)
  end
  it "Returns unauthorized" do
    get :services_filter, { "format" => "json", "id" => @store.id, "username" => "", "password" => "my_password" }
    expect(response.status).to eq(401)
    expect(JSON.parse(response.body)).not_to be_empty
    expect(JSON.parse(response.body)["success"]).to eq(false)
  end
  it "Returns bad request" do
    get :services_filter, { "format" => "json", "id" => "not a valid id", "username" => "my_user", "password" => "my_password" }
    expect(response.status).to eq(400)
    expect(JSON.parse(response.body)).not_to be_empty
    expect(JSON.parse(response.body)["success"]).to eq(false)
  end
  it "Returns record not Found" do
    get :services_filter, { "format" => "json", "id" => "99999", "username" => "my_user", "password" => "my_password" }
    expect(response.status).to eq(404)
    expect(JSON.parse(response.body)).not_to be_empty
    expect(JSON.parse(response.body)["success"]).to eq(false)
  end
end
