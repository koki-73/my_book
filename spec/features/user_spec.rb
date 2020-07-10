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
  
  scenario '新規登録できること' do
    # ログイン前にはログアウトリンクがない
    visit root_path
    expect(page).to have_no_content('ログアウト')
    
    # 新規登録処理
    visit new_user_registration_path
    fill_in 'user_nickname', with: "neko"
    fill_in 'user_email', with: "neko@gmail.com"
    fill_in 'user_password', with: "nyannyan"
    fill_in 'user_password_confirmation', with: "nyannyan"
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('ログアウト')
  end
end