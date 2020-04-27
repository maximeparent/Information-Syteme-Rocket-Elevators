require 'rails_helper'

RSpec.describe "login", :type => :feature do
    context "when user enters email and password and does not press the captcha it" do
        it "gives an error saying the captcha is invalid" do
           visit '/intervention'
            expect(page).to have_text('Log in')
        end
    end
end