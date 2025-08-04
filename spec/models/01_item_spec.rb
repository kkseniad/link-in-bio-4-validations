require "rails_helper"

describe "Item" do
  it "has a class defined in app/models/", points: 1 do
    expect { Item }.to_not raise_error,
      "Expected a Item class to be defined in the app/models/ folder, but didn't find one."
  end
end
