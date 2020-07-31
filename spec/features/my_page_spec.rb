require 'rails_helper'

feature 'my_page', type: :feature do
  
  let!(:user) { create(:user) }
  let!(:book) { create(:book) }
  let!(:book_user) { BookUser.create(book_id: book.id, user_id: user.id, status: 0) }
  let!(:note) { create(:note, book_id: book.id, user_id: user.id) }
  let!(:action_plan) { create(:action_plan, note_id: note.id, user_id: user.id) }

  # 事前にログイン処理
  before do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click
  end
  
  scenario 'トップページからマイページに移動できること' do
    # マイページへ移動
    visit root_path
    find('.user-name').click
    expect(current_path).to eq user_path(user.id)
  end
end
