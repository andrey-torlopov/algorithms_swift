import Foundation

// You are climbing a staircase. It takes n steps to reach the top.
// Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

// - - - - - - - - 2 1 !

class SolutionClimbStairs {

    func climbStairs(_ n: Int) -> Int {
        if n <= 2 { return n }
        var ways = [Int](repeating: 0, count: n + 1)
        
        ways[1] = 1
        ways[2] = 2

        for i in 3...n {
            ways[i] = ways[i - 1] + ways[i - 2]
        }

        return ways[n]
    }
}
