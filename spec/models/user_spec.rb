require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nicknameとemail、passwordとpassword_confirmation、first・last_name、_kana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end

      it 'passwordが5文字以下では登録できない' do
        @user.password = 'A1234'
        @user.password_confirmation = 'A1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129, max_length: 150)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end

      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'A12345'
        @user.password_confirmation = 'A123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'ABCDEFG'
        @user.password_confirmation = 'ABCDEFG'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は6文字以上で、半角英字と半角数字の両方を含めてください')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は6文字以上で、半角英字と半角数字の両方を含めてください')
      end
      it 'passwordが全角だと登録できない' do
        @user.password = '１２３４５６ａ'
        @user.password_confirmation = '１２３４５６ａ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は6文字以上で、半角英字と半角数字の両方を含めてください')
      end

      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'first_nameは半角だと登録できない' do
        @user.first_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
      end
      it 'last_nameは半角だと登録できない' do
        @user.last_name = 'taro'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name 全角文字を使用してください')
      end
      it 'first_name_kanaは”半角カナ”だと登録できない' do
        @user.first_name_kana = 'ﾔﾏﾀﾞ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カナを使用してください')
      end
      it 'last_name_kanaは”半角カナ”だと登録できない' do
        @user.last_name_kana = 'ﾀﾛｳ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角カナを使用してください')
      end
      it 'first_name_kanaは”全角かな”だと登録できない' do
        @user.first_name_kana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana 全角カナを使用してください')
      end
      it 'last_name_kanaは”全角かな”だと登録できない' do
        @user.last_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana 全角カナを使用してください')
      end
    end
  end
end
