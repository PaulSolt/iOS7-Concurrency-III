//: [Previous](@previous)

import Foundation

class Atomic<Value> {
    private var value: Value
    private let q = DispatchQueue(label: "SerialQueue")
    
    init(value: Value) {
        self.value = value
    }
    
    func modify(_ modifier: (Value) -> Value) {
        q.sync {
            value = modifier(value) // transform the value and store result
        }
    }
    
    func get() -> Value {
        return q.sync { value }
    }
}

let sharedValue = Atomic(value: 40)

DispatchQueue.concurrentPerform(iterations: 10) { (threadNumber) in
    
    sharedValue.modify { (value) -> Int in
        return value + 1 // * 3
    }
}
sharedValue.get()


//: [Next](@next)
