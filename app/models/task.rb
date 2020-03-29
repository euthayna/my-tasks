class Task < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :user

  def completed?
    completed_at?
  end

  def status
    if completed_at?
      'complete'
    else
      'pending'
    end
  end
end
