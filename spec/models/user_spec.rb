require 'rails_helper'

describe User do
  describe '#create' do
    it "全ての項目がある場合は登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nikcnameがない場合は登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "profileが空でも登録できること" do
      user = build(:user, profile: "")
      expect(user).to be_valid
    end

    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "emailに@が含まれていない場合は登録できないこと" do
      user = build(:user, email: "testtest")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "passwordとpassword_confirmationが異なる場合は登録できないこと" do
      user = build(:user, password_confirmation: "differentWord")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it " passwordが8文字であれば登録できること " do
      user = build(:user, password: "00000000", password_confirmation: "00000000")
      user.valid?
      expect(user).to be_valid
    end

    it " passwordが7文字であれば登録できないこと " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user.errors[:password]).to include("は8文字以上で入力してください")
    end

    it " passwordが20文字であれば登録できること " do
      user = build(:user, password: "00000000011111111112", password_confirmation: "00000000011111111112")
      user.valid?
      expect(user).to be_valid
    end

    it " passwordが21文字であれば登録できないこと " do
      user = build(:user, password: "000000000111111111122", password_confirmation: "000000000111111111122")
      user.valid?
      expect(user.errors[:password]).to include("は20文字以内で入力してください")
    end

  end
end


user = User.new(nickname: "", email:"neko@gmail.com", password: "nekoneko", password_confirmation: "nekoneko")