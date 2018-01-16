//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let last = args[args.count - 1]
        let intLast = Int(last)
        if args.count == 1 {
            return 0
        }
        let secondElement = args[1]
        let intSecondElement = Int(args[1])
        if intLast == nil {
            enum OperationType {
                case blank
                case count
                case avg
                case fact
            }
            var Operation = OperationType.blank
            if last == ("count") {
                Operation = OperationType.count
            } else if last == ("avg") {
                Operation = OperationType.avg
            } else if last == ("fact") {
                Operation = OperationType.fact
            }
            switch Operation {
                case .count: return args.count - 1
                case .avg:
                    var sum = 0;
                    for i in 0...args.count-2 {
                        sum += Int(args[i])!
                    }
                    return sum / (args.count - 1)
                case .fact :
                    var sum = 1;
                    let firstNum = Int(args[0])!
                    if firstNum > 0 {
                        for i in 1...firstNum  {
                            sum = sum * i
                        }
                    } else {
                        let negFirstNum = firstNum * -1
                        for i in 1...negFirstNum  {
                            sum = sum * i * -1
                        }
                    }
                    return sum
                case .blank:
                    print("Could not calculate that input. Failed with complex operation.")
                    return -1
            }
        } else if intSecondElement == nil {
            enum OperationType {
                case blank
                case add
                case substract
                case divide
                case mod
                case multiply
            }
            var Operation = OperationType.blank
            if secondElement == ("+") {
                Operation = OperationType.add
            } else if secondElement == ("-") {
                Operation = OperationType.substract
                //fix
            } else if secondElement == ("/") {
                Operation = OperationType.divide
                //fix
            } else if secondElement == ("%") {
                Operation = OperationType.mod
                //fix
            } else if secondElement == ("*") {
                Operation = OperationType.multiply
            }
            let firstNum = Int(args[0])!
            let secondNum = Int(args[2])!
            switch Operation {
            case .add: return firstNum + secondNum
            case .substract: return firstNum - secondNum
            case .divide: return firstNum / secondNum
            case .mod:
                if (firstNum > 0 && secondNum < 0) || (firstNum < 0 && secondNum < 0) {
                    return -1 * (firstNum % secondNum)
                } else {
                   return firstNum % secondNum
                }
            case .multiply: return firstNum * secondNum
            case .blank:
                print("Could not calculate that input. Failed with simple operation.")
                return -1
            }
        }
        else {
            print("Could not calculate that input. Big Fail")
            return -1
        }
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

