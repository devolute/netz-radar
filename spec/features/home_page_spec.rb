require "spec_helper"

feature "homepage" do

  scenario "should welcome text" do
    visit("/")
    page.should have_content("Netz-Radar")
  end

end
