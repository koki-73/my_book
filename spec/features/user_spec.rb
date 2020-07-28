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
    fill_in 'user_nickname', with: 'neko'
    fill_in 'user_email', with: 'neko@gmail.com'
    fill_in 'user_password', with: 'nyannyan'
    fill_in 'user_password_confirmation', with: 'nyannyan'
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    expect(page).to have_content('ログアウト')
  end

  scenario 'プロフィール編集ができること', js: true do
    # ログイン＆マイページへ移動
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click
    visit user_path(user.id)
    
    # プロフィール編集
    find('.profile-edit-btn').click
    expect(current_path).to eq edit_user_registration_path
    fill_in 'user_nickname', with: 'kuma'
    fill_in 'user_email', with: 'kuma@gmail.com'
    fill_in 'user_profile', with: 'good morning'
    click_button('変更')
    user = User.last
    expect(user.nickname).to eq('kuma')
    expect(user.email).to eq('kuma@gmail.com')
    expect(user.profile).to eq('good morning')
  end
end