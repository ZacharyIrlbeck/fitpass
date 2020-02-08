require 'rails_helper'

describe "basic gym data flow", type: :feature do
	it "shows list of countries" do
		visit '/'
		expect(page).to have_text 'Countries'
		expect(page).to have_text 'Mexico'
		expect(page).to have_text 'Chile'
		expect(page).to have_text 'Peru'
	end

	it "lists cities for a country" do
		visit '/'
		click_link 'Mexico'

		expect(page).to have_text 'Cities'
	end

	it "lists zones for a city" do
		visit '/'
		click_link 'Mexico'
		click_link '8 - CANCUN'

		expect(page).to have_text 'Zones'
	end
end