class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  
  validates :nickname, presence: true
  validates :birth_date, presence: true

  # パスワード：半角英数字混合
  PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-z\d]+\z/
  validates_format_of :password, with: PASSWORD_REGEX,
                                 message: 'must include both letters and numbers, and be half-width characters only'

  # 姓名（全角漢字・ひらがな・カタカナ）
  validates :last_name, presence: true,
                        format: { with: /\A[ぁ-んァ-ヶー一-龥々ヴヵヶ]+\z/, message: 'must be in full-width characters (kanji, hiragana, or katakana)' }
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ヶー一-龥々ヴヵヶ]+\z/, message: 'must be in full-width characters (kanji, hiragana, or katakana)' }

  # カナ（全角カタカナ）
  validates :last_name_kana, presence: true,
                             format: { with: /\A[ァ-ヶー－]+\z/, message: 'must be in full-width katakana characters' }
  validates :first_name_kana, presence: true,
                              format: { with: /\A[ァ-ヶー－]+\z/, message: 'must be in full-width katakana characters' }
  
end
