import Foundation

class Solution {
    func romanToInt(_ s: String) -> Int {
        var result: Int = 0
    
        let char = [Character](s) /// XLV 45 10 50 5
        
        let values: [Character: Int] = [ "I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        
        var intValues = [Int]()
        
        for ch in char { //XLV
            for (key, value) in values {
                if ch == key {
                    intValues.append(value)
                }
            }
        } //10 50 5
        
        print(intValues)
        
        switch char.count {
        case 0:
            print("number doesnt exist")
        case 1:
            result += intValues[0]
        case 2...:
            for index in (0...intValues.count - 2) {
                if intValues[index] < intValues[index + 1] {
                    result -= intValues[index]
                } else {
                    result += intValues[index]
                }
            }
            result += intValues[intValues.count-1]
        default:
            print("magic happened")
        }
        return result
    }
}
let rom = Solution()
print(rom.romanToInt("V"))

var str = "XLV"
let char = [Character](str)
print(char)
