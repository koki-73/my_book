require 'rails_helper'

feature 'user', type: :feature do
  let(:user) { create(:user) }

  scenario 'ログインできること' do
    # ログイン前にはログアウトリンクがない
    visit root_path
    expect(page).to have_no_content('ログアウト')

    # ログイン処理
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('ログアウト')
    
  end
end