require 'rails_helper'

describe 'Dog resource', type: :feature do
  before do
    @user = create(:user)
    sign_in @user
  end

  it 'can create a profile' do
    visit new_user_dog_path(@user)
    fill_in 'Name', with: 'Speck'
    fill_in 'Description', with: 'Just a dog'
    attach_file 'Image', 'spec/fixtures/images/speck.jpg'
    click_button 'Create Dog'
    expect(Dog.count).to eq(1)
  end

  it 'can edit a dog profile if the user owns the dog' do
    dog = create(:dog)
    sign_in dog.user

    visit edit_dog_path(dog)
    fill_in 'Name', with: 'Speck'
    click_button 'Update Dog'
    expect(dog.reload.name).to eq('Speck')
  end

  it 'can\'t edit a dog profile if the user doesn\'t own the dog' do
    dog = create(:dog)

    visit dog_path(dog)
    expect(page).to have_no_link("Edit #{dog.name}'s Profile")
  end

  it 'can delete a dog profile if the user owns the dog' do
    dog = create(:dog)
    sign_in dog.user

    visit dog_path(dog)
    click_link "Delete #{dog.name}'s Profile"
    expect(Dog.count).to eq(0)
  end

  it 'can\'t delete a dog profile if the user doesn\'t own the dog' do
    dog = create(:dog)

    visit dog_path(dog)
    expect(page).to have_no_link("Edit #{dog.name}'s Profile")
  end
end
