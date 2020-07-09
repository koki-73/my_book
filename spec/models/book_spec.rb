# require 'rails_helper'
# describe Book do
#   describe '#create' do
#     it "titleがない場合は登録できないこと" do
#       book = Book.new(title: "")
#       book.valid?
#       expect(book.errors[:title]).to include("can't be blank")
#     end
#   end
# end