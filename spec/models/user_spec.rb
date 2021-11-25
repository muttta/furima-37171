require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー登録' do
    context '新規登録できるとき' do
      it'nicknameとemail、passwordとpassword_confirmation,birth,last_name,last_name_kana,first_name,first_name_kanaが存在すれば登録ができる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'birthが空では登録ができない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailは重複して登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@が含まれていないと登録ができない' do
        @user.email = 'aaaa.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空では登録ができない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordは5文字以下では登録ができない' do
        @user.password = '111aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordは半角英数字でないと登録ができない' do 
        @user.password = 'へけけけけけ'
        @user.password_confirmation = 'へけけけけけ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字混合で入力してください")
      end
      it 'passwordは数字のみでは登録ができない' do 
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字混合で入力してください")
      end
      it 'passwordは英字のみでは登録ができない' do 
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password は半角英数字混合で入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録ができない' do
        @user.password = '111aaa'
        @user.password_confirmation = '222bbb'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録ができない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameは全角（漢字・ひらがな・カタカナ）でなけれは登録ができない' do
        @user.last_name = 'hamutaro'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name は全角(漢字・ひらがな・カタカナ)で入力してください")
      end
      it 'last_name_kanaが空では登録ができない' do 
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaは全角（カタカナ）でなけれは登録ができない' do
        @user.last_name_kana = 'はむたろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana は全角(カタカナ)で入力してください")
      end
      it 'first_nameが空では登録ができない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameは全角（漢字・ひらがな・カタカナ）でなけれは登録ができない' do
        @user.first_name = 'tottoko'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name は全角(漢字・ひらがな・カタカナ)で入力してください")
      end
      it 'first_name_kanaが空では登録ができない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaは全角（カタカナ）でなけれは登録ができない' do
        @user.first_name_kana = 'とっとこ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana は全角(カタカナ)で入力してください")
      end
    end
  end
end
