class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items

  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  NAME_KANA_REGEX = /\A[ァ-ヶー]+\z/
  PASSSWORD_REGEX = /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/

  validates :password, format: { with: PASSSWORD_REGEX, message: 'は6文字以上で、半角英字と半角数字の両方を含めてください' }
  validates :nickname, presence: true
  validates :birthday, presence: true
  with_options presence: true, format: { with: NAME_REGEX, message: '全角文字を使用してください' } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: NAME_KANA_REGEX, message: '全角カナを使用してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end
end
