describe "Articles Features", :type => :feature do
  before :each do
  	@store = create(:store)
  end
  it "Create new article" do
    visit "/articles/new"

    fill_in "Name", :with => "article name #{SecureRandom.base64(6)}"
    fill_in "Description", :with => "article description"
    fill_in "Price", :with => "100"
    fill_in "Total in shelf", :with => "10"
    fill_in "Total in vault", :with => "50"
    select(@store.id, :from => 'Store')

    click_button "Create Article"

    expect(page).to have_content "successfully"
  end
end