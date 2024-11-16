import PlaygroundSupport

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard let firstString = strs.first else { return "" }
        var firstIterator = strs.first?.makeIterator()
        var iterators = strs.dropFirst().map { $0.makeIterator() }
        var count = 0
        while true {
            guard let nextCharacter = firstIterator?.next() else { break }
            guard iterators.indices.allSatisfy({ iterators[$0].next() == nextCharacter }) else { break }
            count += 1
        }
        let endIndex = firstString.index(firstString.startIndex, offsetBy: count)
        return String(firstString[..<endIndex])
    }
}

let solution = Solution()

print(solution.longestCommonPrefix([String]()))
print(solution.longestCommonPrefix(["Sphynx"]))
print(solution.longestCommonPrefix(["Sphynx", "Sphblack", "Sphquartz", "Sphjudge"]))
