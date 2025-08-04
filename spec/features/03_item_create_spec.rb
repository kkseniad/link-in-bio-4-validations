require "rails_helper"

describe "/backdoor" do
  it "has a form", :points => 1 do
    visit "/backdoor"

    expect(page).to have_css("form", minimum: 1)
  end
end

describe "/backdoor" do
  it "has a label for 'Link URL' with text: 'Link URL'", :points => 1, hint: h("copy_must_match label_for_input") do
    visit "/backdoor"

    expect(page).to have_css("label", text: "Link URL")
  end
end

describe "/backdoor" do
  it "has at least one input elements", :points => 1, hint: h("label_for_input") do
    visit "/backdoor"

    expect(page).to have_css("input", minimum: 1)
  end
end

describe "/backdoor" do
  it "has a button with text 'Create item'", :points => 1, hint: h("copy_must_match") do
    visit "/backdoor"

    expect(page).to have_css("button", text: "Create item")
  end
end

describe "/backdoor" do
  it "does not create an Item when incomplete 'Create item' form is submitted", :points => 5, hint: h("copy_must_match button_type label_for_input") do
    initial_number_of_items = Item.count
    test_url = "https://en.wikipedia.org/wiki/Frog"

    visit "/backdoor"

    fill_in "Link URL", with: test_url
    click_on "Create item"

    final_number_of_items = Item.count

    expect(final_number_of_items).to eq(initial_number_of_items)
  end
end

describe "/backdoor" do
  it "displays information about the validation error when incomplete 'Create item' form is submitted", :points => 5, hint: h("copy_must_match button_type label_for_input") do
    test_url = "https://en.wikipedia.org/wiki/Frog"
    test_description = "Frog"

    visit "/backdoor"

    fill_in "Link URL", with: test_url
    fill_in "Link Description", with: test_description
    click_on "Create item"

    expect(page).to have_content(/Thumbnail URL can't be blank/i)
  end
end

describe "/backdoor" do
  it "creates an Item when complete 'Create item' form is submitted", :points => 5, hint: h("copy_must_match button_type label_for_input") do
    initial_number_of_items = Item.count
    test_url = "https://en.wikipedia.org/wiki/Frog"
    test_description = "Frog"
    test_thumbnail = "https://example.com/frog_thumbnail.jpg"

    visit "/backdoor"

    fill_in "Link URL", with: test_url
    fill_in "Link Description", with: test_description
    fill_in "Thumbnail URL", with: test_thumbnail
    click_on "Create item"

    final_number_of_items = Item.count

    expect(final_number_of_items).to eq(initial_number_of_items + 1)
  end
end

describe "/backdoor" do
  it "displays feedback that the item was created after submitting the form", :points => 5, hint: h("copy_must_match button_type label_for_input") do
    test_url = "https://en.wikipedia.org/wiki/Frog"
    test_description = "Frog"
    test_thumbnail = "https://example.com/frog_thumbnail.jpg"

    visit "/backdoor"

    fill_in "Link URL", with: test_url
    fill_in "Link Description", with: test_description
    fill_in "Thumbnail URL", with: test_thumbnail
    click_on "Create item"

    expect(page).to have_content(/Item created successfully/i)
  end
end
