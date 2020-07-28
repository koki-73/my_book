require 'rails_helper'

feature 'my_page', type: :feature do
  
  let(:user) { create(:user) }
  let(:book) { create(:book) }
  let(:note) { create(:note, book_id: book.id, user_id: user.id) }
  let(:action_plan) { create(:action_plan, note_id: note.id, user_id: user.id) }
  
  scenario 'ログイン後マイページに移動できること' do
    # ログイン処理
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click

    # マイページへ移動
    # visit user_path(user.id)
    find('.user-name').click
    expect(current_path).to eq user_path(user.id)
  end
end
