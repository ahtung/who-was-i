require 'rails_helper'

describe 'User' do

  let!(:user) { FactoryGirl.create(:user) }

  it 'should be able to start a search by typing in a name and a birth date' do
    visit root_path
    fill_in 'name', user.name
    fill_in 'birthday', user.born_on
    click_on 'search'
    
    expect(page).to have_content 'searching...'
  end
end