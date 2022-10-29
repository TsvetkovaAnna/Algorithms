import Foundation

//[3,5,4,1,2,7,8] -> "1-5,7-8"
func getRange(arr: [Int]) -> [[Int]] {
    var ranges = [[Int]]()
    if arr.count == 0 {
        return ranges
    }
    if arr.count == 1 {
        return [arr]
    }
    let sorted = arr.sorted()
    
    ranges.append([sorted[0]])
    
    for ind in 0..<sorted.count-1 {
        if sorted[ind + 1] - sorted[ind] > 1 {
            if ranges[ranges.count-1].last != sorted[ind] {
                ranges[ranges.count-1].append(sorted[ind])
                print("19: \(sorted[ind])")
            }
            ranges.append([sorted[ind + 1]])
            print("22 (\(ind): \([sorted[ind + 1]])")
        }
    }

    if sorted.last! != ranges[ranges.count-1].last! {
        ranges[ranges.count-1].append(sorted.last!)
        print("28: \(sorted.last!)")
    }
    return ranges
}
let arr = [9,3,5,4,7,1,2]
print(getRange(arr: arr))
