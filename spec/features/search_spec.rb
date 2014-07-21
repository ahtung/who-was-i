require 'rails_helper'

describe 'User', js: true do

  let!(:user) { FactoryGirl.create(:user) }
  
  before :each do
    visit root_path
    fill_in 'ancestor_name', with: user.name
    fill_in 'ancestor_birthday', with: user.born_on
    click_on 'search'
  end

  it 'should be able to start a search by typing in a name and a birth date' do
    expect(page).to have_content "searching..."
  end
  it 'should be able to pick the first branch from the options' do
    expect(page).to have_content "who do you think you were?"
    save_and_open_page
    click_on 'George'
    
    expect(page).to have_content "searching..."
  end
end