class Comment < ActiveRecord::Base
	belongs_to :question, :class_name => 'Question'
	belongs_to :user, :class_name => 'User'
	
	validates :user_id, presence: true
	validates :question_id, presence: true
	validates :body, presence: true
end
