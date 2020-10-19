require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが入力されていれば登録できる' do
        @user.nickname = 'abe'
        expect(@user).to be_valid
      end
      it 'emailが一意であれば登録できる' do
        @user.email = 'sample@gmail.com'
        expect(@user).to be_valid
      end
      it 'emailが＠を含んでいれば登録できる' do
        @user.email = '111@email.com'
        expect(@user).to be_valid
      end
      it 'パスワードが半角英数混合で６文字以上であれば登録できる' do
        @user.password = 'qqq111'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it '確認用パスワードがパスワードと一致していれば登録できる' do
        @user.password = 'w1w1w1'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it 'ユーザー本名が全角で苗字と名前があれば登録できる' do
        @user.last_name = '田中'
        @user.first_name = '次郎'
        expect(@user).to be_valid
      end
      it 'ユーザー本名のふりがなが全角カタカナであれば登録できる' do
        @user.last_name_kana = 'タナカ'
        @user.first_name_kana = 'ジロウ'
        expect(@user).to be_valid
      end
      it '生年月日が入力されていれば登録できる' do
        @user.birth_date = '20150101'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空の場合登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空の場合登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが一意でない場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれない場合登録できない' do
        @user.email = 'sampleemail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードが空の場合登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'パスワードが5文字以内の場合登録できない' do
        @user.password = 'qq111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'パスワードが半角英字のみの場合登録できない' do
        @user.password = 'qqqqqq'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'パスワードが数字のみの場合登録できない' do
        @user.password = '111111'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it '確認用パスワードが空の場合登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '確認用パスワードがパスワードと一致していない場合登録できない' do
        @user.password = 'qqq111'
        @user.password_confirmation = 'qqw111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'ユーザー本名の名字が空の場合登録できない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'ユーザー本名の名前がからの場合登録できない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'ユーザー本名の名字が全角でない場合登録できない' do
        @user.last_name = 'tanaka'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'ユーザー本名の名前が全角でない場合登録できない' do
        @user.first_name = 'jirou'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'ユーザー本名の名字のふりがなが空の場合登録できない' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'ユーザー本名の名前のふりがなが空の場合登録できない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'ユーザー本名の名字のふりがながカタカナでない場合登録できない' do
        @user.last_name_kana = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'ユーザー本名の名前のふりがながカタカナでない場合登録できない' do
        @user.first_name_kana = 'じろう'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it '生年月日が入力されていない場合登録できない' do
        @user.birth_date = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
