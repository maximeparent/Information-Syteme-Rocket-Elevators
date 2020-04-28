require 'rails_helper'

RSpec.describe "quote", :type => :feature do
    context "when user goes to the quote page" do
        it "displays the quote form" do
           visit '/quoteform'
            expect(page).to have_text('Request Form:')
        end
    end
end