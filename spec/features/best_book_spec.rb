require 'rails_helper'

feature 'user', type: :feature do
  
  let!(:user) { create(:user) }
  let!(:books) do
    3.times do
      book = create(:book)
      BookUser.create(book_id: book.id, user_id: user.id, status: 0)
    end
  end

  before do
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click
  end

  scenario 'ベスト3の登録ができること', js: true do
    books = user.books
    visit user_path(user.id)
    find('.best-book-edit-btn').click
    expect(current_path).to eq new_user_best_book_path(user.id)
    expect{
      select "#{books[0].title}", from: 'best_book[best_book_id]'
      select "#{books[1].title}", from: 'best_book[second_book_id]'
      select "#{books[2].title}", from: 'best_book[third_book_id]'
      find('input[type="submit"]').click
    }.to change(BestBook, :count).by(1)
    expect(user.best_book.best_book_id).to eq(books[0].id)
    expect(user.best_book.second_book_id).to eq(books[1].id)
    expect(user.best_book.third_book_id).to eq(books[2].id)
  end
end