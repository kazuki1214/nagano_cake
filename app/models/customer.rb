class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :addressses, dependent: :destroy
  has_many :orders, dependent: :destroy

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: { with: /\A[\p{katakana}　ー]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[\p{katakana}　ー]+\z/ }
  validates :postal_code, presence: true, format: { with: /\A\d{7}\z/ }
  validates :address, presence: true
  validates :telephone_number, presence: true, format: { with: /\A\d{10}\z|\A\d{11}\z/ }


  VALID_POST_CORD = /\A\d{7}\z/
  #正規表現を使い,文頭(\A)から文末(\z)まで7文字の10進数の数字で(\d{7})で入力しろということ
  VALID_TELEPHONE_CODE = /\A\d{10}\z|\A\d{11}\z/
  #正規表現を使い,文頭(\A)から文末(\z)まで10文字の10進数の数字で(\d{10})で入力しろということと。11文字の10進数の数字で入力しろということ（｜で区切っている）
  VALID_KANA_CODE = /\A[\p{katakana}　ー]+\z/
  #正規表現を使い,文頭(\A)から文末(\z)までカタカナで入力しろ(\p{katakana})ということ。（ー）は\p{katakana}では長音は入力できないため直接入力。＋は「１個以上」という意味

  def full_name
    last_name + first_name
  end
end
