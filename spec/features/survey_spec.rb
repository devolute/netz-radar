# encoding: utf-8
require "spec_helper"

feature "survey calculations", :js => true do

  background {
    # load fake cards
    KreuzOMat.data.cards = load_yaml_fixtures("cards.yml")
    KreuzOMat.data.parties = load_yaml_fixtures("parties.yml")
    visit "/survey"
  }

  scenario "should see the survey" do
    expect(page).to have_content("2")
    expect(page).to have_content("FAKE_CATEGORY")
  end

  scenario "clicking through the survey" do
    # statements
    first_statement = find("#statement-1-1")
    expect(first_statement.tag_name).to eq("li")
    first_statement.click

    next_button = find("button.next")
    expect(next_button.find(".text").text).to eq("Weiter")

    next_button.click
    second_statement = find("#statement-2-1")

    expect(second_statement.tag_name).to eq("li")
    second_statement.click
    expect(next_button.find(".text").text).to eq("Fertig")

    next_button.click

    # priorization
    expect(page).to have_content("markieren Sie nochmals bis zu 3 Statements")

    find("#statement-1-1").click


    results_button = find("button.to-results")
    results_button.click

    # results
    expect(page).to have_content("Ihr Ergebnis")
    expect(page).to have_content("Party A: 67%")
    expect(page).to have_content("Party B: 33%")
  end



end
