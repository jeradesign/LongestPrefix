import Cocoa

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard strs.count > 0 else {
            return ""
        }
        guard strs.count > 1 else {
            return strs[0]
        }
        
        let charArrays = strs.map { [Character]($0) }

//        let minlen = charArrays.map { $0.count } .min() ?? 0
        let minlen = charArrays.lazy.map(\.count) .min() ?? 0
//        print("minlen = \(minlen)")
        var result = [Character]()
        for i in 0..<minlen {
            let firstCharArray = charArrays[0]
            let firstChar = firstCharArray[i]
            for charArray in charArrays[1..<charArrays.count] {
                if charArray[i] != firstChar {
                    return String(result)
                }
            }
            result.append(firstChar)
        }
        return String(result)
    }
}

let solution = Solution()

print(solution.longestCommonPrefix([String]()))
print(solution.longestCommonPrefix(["Sphynx"]))
print(solution.longestCommonPrefix(["Sphynx", "Sphblack", "Sphquartz", "Sphjudge"]))
//: [Next](@next)
