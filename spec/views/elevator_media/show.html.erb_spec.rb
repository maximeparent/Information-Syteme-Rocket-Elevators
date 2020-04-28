require 'rails_helper'

RSpec.describe "elevator_media/show", type: :view do
  before(:each) do
    @elevator_medium = assign(:elevator_medium, ElevatorMedium.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
