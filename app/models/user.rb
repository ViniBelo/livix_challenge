class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+\z/
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX, message: "must be a valid email address!" }, uniqueness: true


  def transfer(receiver_email, amount)
    sender_balance = self.balance.to_r

    if receiver = User.find_by(email: receiver_email)
      if sender_balance >= amount
        self.update(balance: (sender_balance - amount).to_f)
        receiver.update(balance: (receiver.balance + amount).to_f)
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
