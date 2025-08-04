require "rails_helper"

describe "/" do
  it "lists the link URL and link description of each Item record in the database", points: 5 do

    item_1 = Item.new
    item_1.link_url = "https://en.wikipedia.org/wiki/Frog"
    item_1.link_description = "Wikipedia Frog Article"
    item_1.thumbnail_url = "https://upload.wikimedia.org/wikipedia/commons/4/4f/Bombina_bombina_1_%28Marek_Szczepanek%29_tight_crop.jpg"
    item_1.save

    item_2 = Item.new
    item_2.link_url = "https://rubyonrails.org/"
    item_2.link_description = "Rails Homepage"
    item_2.thumbnail_url = "https://upload.wikimedia.org/wikipedia/commons/6/62/Ruby_On_Rails_Logo.svg"
    item_2.save

    visit "/"

    expect(page).to have_tag("a", :with => { :href => "#{item_1.link_url}" }, :text => /#{item_1.link_description}/),
      "Expected page to have a link with the text #{item_1.link_description} and an href of #{item_1.link_url}"

    expect(page).to have_tag("a", :with => { :href => "#{item_2.link_url}" }, :text => /#{item_2.link_description}/),
      "Expected page to have a link with the text #{item_2.link_description} and an href of #{item_2.link_url}"
  end
end
