class User < ApplicationRecord
    scope :active_users, -> {where(active: true)}
    scope :inactive_users, -> {where(active: false)}
    validates :name, presence: true
    validates :email, presence: true

end
