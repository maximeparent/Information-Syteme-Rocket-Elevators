require 'rails_helper'

RSpec.describe "elevator_media/edit", type: :view do
  before(:each) do
    @elevator_medium = assign(:elevator_medium, ElevatorMedium.create!())
  end

  it "renders the edit elevator_medium form" do
    render

    assert_select "form[action=?][method=?]", elevator_medium_path(@elevator_medium), "post" do
    end
  end
end
