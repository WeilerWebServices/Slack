class Adder
  include Sidekiq::Worker

  def perform(digits)
    digits.sum
  end
end
