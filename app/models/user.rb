class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :birth_date, presence: true

  # パスワード：半角英数字混合
  PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-z\d]+\z/
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には半角英数字混合で入力してください'

  # 姓名（全角漢字・ひらがな・カタカナ）
  validates :last_name, presence: true,
                        format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }

  # カナ（全角カタカナ）
  validates :last_name_kana, presence: true,
                             format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }
  validates :first_name_kana, presence: true,
                              format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナで入力してください' }
end
