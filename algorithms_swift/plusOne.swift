
class Solution {
    
    func plusOne(_ digits: [Int]) -> [Int] {
        var result = Array(digits.reversed())
        
        var k = 0
        
        while k < result.count {
            if result[k] < 9 {
                result[k] = result[k] + 1
                return Array(result.reversed())
            } else {
                result[k] = 0
                k += 1
            }
        }
        result.append(1)
        return Array(result.reversed())
    }
}

let s = Solution()
let b = s.plusOne([9,9,9])
print(b)
