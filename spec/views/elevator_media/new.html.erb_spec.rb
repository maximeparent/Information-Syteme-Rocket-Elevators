require 'rails_helper'

RSpec.describe "elevator_media/new", type: :view do
  before(:each) do
    assign(:elevator_medium, ElevatorMedium.new())
  end

  it "renders new elevator_medium form" do
    render

    assert_select "form[action=?][method=?]", elevator_media_path, "post" do
    end
  end
end
