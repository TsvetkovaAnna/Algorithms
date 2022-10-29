import Foundation

class Solution2 {
    
    func letterIndex(_ letter: Character) -> Int {
        return Int(letter.unicodeScalars.first!.value) - Int(Unicode.Scalar("a").value)
    }
    
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var indices = [Int]()
        
        if s.count >= p.count {
            let sArray = s.map { letterIndex($0) }
            let pArray = p.map { letterIndex($0) }
            if sArray == pArray {
                indices.append(0)
            } else if Set(sArray) == Set(pArray) && Set(sArray).count == 1 && Set(pArray).count == 1 {
                indices = Array(0...(sArray.count-pArray.count))
            } else {
                
                var pDict = [Int: Int]()
                let pCount = pArray.count
                let sCount = sArray.count
                for i in pArray {
                    pDict[i] = (pDict[i] ?? 0) + 1
                }
                
                var left = 0
                var right = 0
                var sDict = [Int: Int]()
                
                while left < (sCount - pCount + 1) {
                    
                    sDict[sArray[right]] = (sDict[sArray[right]] ?? 0) + 1
                    right += 1
                    if right == left + pCount {
                        if sDict == pDict{
                            indices.append(left)
                        }
                        var sss:Int? = sDict[sArray[left]]
                        if sss == 1 {
                            sss = nil
                        } else {
                            sss! -= 1
                        }
                        sDict[sArray[left]] = sss
                        left += 1
                        
                    }
                }
            }
        }
        return indices
    }
}

let s2 = "cbaebabacd"
let p = "abc"//"a"//"b"//
let sol = Solution2()
print(sol.findAnagrams(s2, p))
