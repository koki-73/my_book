require 'rails_helper'

feature 'note', type: :feature do
  
  let(:user) { create(:user) }
  let(:book) { create(:book) }
  
  scenario 'ノートの登録ができること' do
    # ログイン処理
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click

    # ノート新規作成
    # クリック操作でノート作成ページに移動させたい
    visit new_book_note_path(book.id)
    expect {
      fill_in 'note_purpose_attributes_content', with: 'purpose-test'
      fill_in 'note_summaries_attributes_0_title', with: 'summary-title-test'
      fill_in 'note_summaries_attributes_0_content', with: 'summary-content-test'
      fill_in 'note_review_attributes_content', with: 'review-test'
      fill_in 'note_action_plans_attributes_0_content', with: 'action-plan-test'
      fill_in 'note_memo_attributes_content', with: 'memo-test'
      find('input[type="submit"]').click
    }.to change(Note, :count).by(1)
    note = Note.last
    expect(note.purpose.content).to eq('purpose-test')
    expect(note.summaries[0].title).to eq('summary-title-test')
    expect(note.summaries[0].content).to eq('summary-content-test')
    expect(note.review.content).to eq('review-test')
    expect(note.action_plans[0].content).to eq('action-plan-test')
    expect(note.memo.content).to eq('memo-test')

  end
  
end