# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum type: { Admin: 'admin', Developer: 'developer', Gamer: 'gamer' }

  has_many :games, through: :game_users
  has_many :reviews, dependent: :destroy
  has_many :carts, dependent: :destroy
  has_one_attached :avatar
  has_many :invitations, dependent: :destroy
  has_many :pending_invitations, -> { where confirmed: flase }, class_name: 'Invitation', foreign_key: 'friend_id', dependent: :destroy

  validates :name, :email, :type, :phone_number, presence: true

  def friends
    sent_invitations = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
    received_invitations = Invitation.where(user_id: id, confirmed: true).pluck(:user_id)
    ids = sent_invitations + received_invitations
    User.where(id: ids)
  end

  def friend_with?(user)
    Invitation.confirmed_record?(id, user.id)
  end

  def send_invitation(user)
    invitations.create(friend_id: user.id)
  end
end
