require 'rails_helper'

RSpec.describe "elevator_media/index", type: :view do
  before(:each) do
    assign(:elevator_media, [
      ElevatorMedium.create!(),
      ElevatorMedium.create!()
    ])
  end

  it "renders a list of elevator_media" do
    render
  end
end
