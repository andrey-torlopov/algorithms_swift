import Foundation

/*
 Example 1:
 
 Input: n = 19
 Output: true
 Explanation:
 12 + 92 = 82
 82 + 22 = 68
 62 + 82 = 100
 12 + 02 + 02 = 1
 */

class HappyNumber {
    func isHappy(_ n: Int) -> Bool {
        var visitedNumbers = Set<Int>()
        return isHappyHelper(n, &visitedNumbers)
    }
    
    private func isHappyHelper(_ n: Int, _ visited: inout Set<Int>) -> Bool {
        if n == 1 { return true }
        if visited.contains(n) { return false } // Проверка на наличие цикла
        
        visited.insert(n)
        
        var res: Int = 0
        var nValue = n
        while nValue != 0 {
            let diff = nValue % 10
            res += diff * diff
            nValue /= 10
        }
        
        return isHappyHelper(res, &visited)
    }
}
