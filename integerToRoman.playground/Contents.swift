import Foundation

class Solution {
    func intToRoman(_ num: Int) -> String { //1994 "MCMXCIV"
        var roman: String = ""
        
        let romanDict = [1: "I", 2: "II", 3: "III", 4: "IV", 5: "V", 6: "VI", 7: "VII", 8: "VIII", 9: "IX", 10: "X", 20: "XX", 30: "XXX", 40: "XL", 50: "L", 60: "LX", 70: "LXX", 80: "LXXX", 90: "XC", 100: "C", 200: "CC", 300: "CCC", 400: "CD", 500: "D", 600: "DC", 700: "DCC", 800: "DCCC", 900: "CM", 1000: "M", 2000: "MM", 3000: "MMM"]
        
        let digitsArray:[Int] = String(num).compactMap { Int(String($0)) } // 1994
        var numsArray = [Int]()
        let ten = 10.0
      
        for (index, element) in digitsArray.enumerated() {
            numsArray.append(element*Int(pow(ten, Double(digitsArray.count - index - 1))))
        } // 1000 900 50 4
        
        for i in numsArray {
            for (key, value) in romanDict {
                if i == key {
                    roman.append(value)
                }
            }
        }
        return roman
    }
}

let sol = Solution()
sol.intToRoman(1994)
