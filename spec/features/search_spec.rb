require 'rails_helper'

describe 'User', js: true do

  let!(:user) { FactoryGirl.create(:user) }

  it 'should be able to start a search by typing in a name and a birth date' do
    visit root_path
    fill_in 'ancestor_name', with: user.name
    fill_in 'ancestor_birthday', with: user.born_on
    click_on 'search'
    
    expect(page).to have_content 'searching...'
  end
end