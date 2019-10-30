module ItemsHelper

  def keisan
  price = input

  #販売手数料(commission)
  commission = (price * 0.1).to_i
  
  #販売利益(profit)（価格- 販売手数料）
  profit = (price - commission).to_i
  end
end
