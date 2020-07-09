require 'rails_helper'
describe Book do
  describe '#create' do
    it "全ての項目がある場合は登録できること" do
      book = build(:book)
      expect(book).to be_valid
    end

    it "titleがない場合は登録できないこと" do
      book = build(:book, title: "")
      book.valid?
      expect(book.errors[:title]).to include("を入力してください")
    end

    it "authorがない場合は登録できないこと" do
      book = build(:book, author: "")
      book.valid?
      expect(book.errors[:author]).to include("を入力してください")
    end

    it " 重複したapi_idが存在する場合は登録できないこと " do
      book = create(:book)
      another_book = build(:book, api_id: book.api_id)
      another_book.valid?
      expect(another_book.errors[:api_id]).to include("はすでに存在します")
    end
  end
end