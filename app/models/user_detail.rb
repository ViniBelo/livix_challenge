class UserDetail < ApplicationRecord
  belongs_to :user

  validates :name, presence: true

  def transfer(receiver_email, amount)
    sender_balance = self.balance.to_r

    if receiver = User.find_by(email: receiver_email)
      receiver_details = UserDetail.find_by(user_id: receiver.id)
      if sender_balance >= amount
        self.update(balance: (sender_balance - amount).to_f)
        receiver_details.update(balance: (receiver_details.balance + amount).to_f)
      else
        errors.add(:balance, "is insufficient for this transaction!")
      end
    else
      errors.add(:receiver, "no user found with email: #{receiver_email}")
    end
  end

  def deposit(amount)
    balance = self.balance.to_r
    self.update(balance: (balance + amount).to_f)
  end
end
