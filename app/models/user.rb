class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true     
  # NOT NULL制約では空の文字列は保存可能なため、validatesを使用

  has_many :group_users
  has_many :groups, through: :group_users
  has_many :messages
end
