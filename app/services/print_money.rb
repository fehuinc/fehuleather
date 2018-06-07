class PrintMoney
  def self.cents_to_dollars(cents)
    cents.to_s.rjust(3, "0").insert(-3, ".")
  end

  def self.cents_to_dollars_short(cents)
    cents / 100
  end
end
