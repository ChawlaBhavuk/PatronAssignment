import Foundation

func solve<T: Comparable>(_ sequence: [T]) -> [T] {
    var remaining = sequence
    var result: [T] = []
    var lowest: T?
    var maximum: T?
    while !remaining.isEmpty {
        sortedResult( result: &result, remaining: &remaining, lowest: &lowest, maximum: &maximum)
    }
    return result
}

func sortedResult<T: Comparable>(result: inout [T], remaining: inout [T], lowest: inout T?, maximum: inout T?) {
    if lowest == nil {
        addIntialValue(intial: &lowest, currentValue: remaining.min(), remaining: &remaining, result: &result)
    } else if let bindedlowest = lowest, let nextGreater = nextGreater(sequence: remaining, value: bindedlowest) {
        lowest = nextGreater
        result.append(nextGreater)
        if let lowestIndex = remaining.firstIndex(of: nextGreater) {
            remaining.remove(at: lowestIndex)
        }
    } else
    if maximum == nil{
        addIntialValue(intial: &maximum, currentValue: remaining.max(), remaining: &remaining, result: &result)
    } else
    if let bindedMaximum = maximum, let nextLesser = nextLesser(sequence: remaining, value: bindedMaximum) {
        maximum = nextLesser
        result.append(nextLesser)
        if let lowestIndex = remaining.firstIndex(of: nextLesser) {
            remaining.remove(at: lowestIndex)
        }
    } else {
        lowest = nil
        maximum = nil
    }

}

func addIntialValue<T: Comparable>(intial: inout T?,  currentValue: T?, remaining: inout [T], result: inout [T]) {
        intial = currentValue

    if let intial = intial {
        result.append(intial)
        if let firstIndex = remaining.firstIndex(of: intial) {
            remaining.remove(at: firstIndex)
        }
    }
}

func nextGreater<T: Comparable>(sequence: [T], value: T) -> T? {
    var currentValue: T?
    for i in 0..<sequence.count {
        if let bindedValue = currentValue  {
            if value < sequence[i] && bindedValue > sequence[i] {
                currentValue = sequence[i]
            }
        } else if sequence[i] > value {
            currentValue = sequence[i]
        }
    }
    return currentValue
}


func nextLesser<T: Comparable>(sequence: [T], value: T) -> T? {
    var currentValue: T?
    for i in 0..<sequence.count {
        if let bindedValue = currentValue  {
            if value > sequence[i] && bindedValue < sequence[i] {
                currentValue = sequence[i]
            }
        } else if sequence[i] < value {
            currentValue = sequence[i]
        }
    }
    return currentValue
}


let input1 = ["cat", "fish", "ant", "ant", "elephant", "platypus", "platypus", "cat"]
let output1 = solve(input1)
print(output1)

let input2 = [1, 2, 1, 2, 3, 7, 4, 9, 11, 3, 1, 2, 3, 1, 3, 7, 4, 9]
let output2 = solve(input2)
print(output2)


let input3 = [10.5, 25.6, 10.5, 25.6, 34, 76, 46, 99, 111, 34, 10.5, 25.6, 33, 10.5, 33, 76, 46, 99]
let output3 = solve(input3)
print(output3)
