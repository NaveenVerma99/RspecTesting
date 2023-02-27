class Post < ApplicationRecord
    has_many :comments, dependent: :destroy

    validates :title, :presence => true, :length => { :minimum => 0, :allow_nil => false, :message => "can't be nil" }
end
