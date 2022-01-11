RSpec.describe "User creates post", type: :system, js: true do
  scenario "successfully" do
    visit posts_path

    expect(page).to have_content("New Post")
  end
end
