class Payment < ApplicationRecord
  enum :status, [:attempted, :accepted, :rejected], default: :attempted

  def accept!
    self.status = :accepted
    save!
  end
end
