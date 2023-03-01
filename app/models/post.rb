class Post < ApplicationRecord
    has_many :comments, dependent: :destroy

    validates :title, :presence => true, :length => { :minimum => 0, :allow_nil => false, :message => "can't be nil" }
    before_save :check_body_present
    validate :validate_title

    def check_body_present
        self.body = "This is a system generated body" if body.nil?
    end
    def validate_title
        return if self.title == self.title.upcase
        errors.add(:title , 'Title is not upper case')
    end
end
