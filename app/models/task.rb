class Task < ActiveRecord::Base

  belongs_to :project

  enum status: [:active, :completed]

  validates :content, presence: true
  validates :status, presence: true
  validates :project_id, presence: true

end
