import Foundation

class BuySellStockSolution {
    func maxProfit(_ prices: [Int]) -> Int {
        var minPrice = Int.max
            var maxProfit = 0

            for price in prices {
                if price < minPrice {
                    minPrice = price
                } else if price - minPrice > maxProfit {
                    maxProfit = price - minPrice
                }
            }

            return maxProfit
    }
 
    func test() {
        print(maxProfit([7,1,5,3,6,4]), 5)
        print(maxProfit([7,6, 4, 3, 1]), 0)
    }
}
