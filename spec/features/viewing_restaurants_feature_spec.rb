require 'spec_helper'

describe "restaurants index" do

	
	context 'with restaurants' do

		it 'should display names and description of restaurants' do
			Restaurant.create(name: 'Nandos', description: 'Chicken')
			visit '/restaurants'

			expect(page).to have_content 'Nandos'
			expect(page).to have_content 'Chicken'


		end


	end


	context 'wuthout restaurants' do

		it 'should display a message' do
			visit '/restaurants'
			expect(page).to have_content 'No restaurants yet!'
		end	

	end


end