describe "Stores Features", :type => :feature do
  it "Create new store" do
    visit "/stores/new"

    fill_in "Name", :with => "store name #{SecureRandom.base64(6)}"
    fill_in "Address", :with => "store address #{SecureRandom.base64(6)}"

    click_button "Create Store"

    expect(page).to have_content "successfully"
  end
end