class Contact < ApplicationRecord

  validates :first_name, :last_name, presence: true
  belongs_to :user

  def friendly_updated_at
    created_at.strftime("%A, %d %b %Y %l:%M %p")
  end

  def full_name
    "#{first_name} #{middle_name} #{last_name}" 
  end

end
