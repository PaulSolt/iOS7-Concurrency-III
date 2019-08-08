import Foundation

let queue = DispatchQueue.global()

print("1. I'm on the main thread")

queue.async {
    usleep(2_000_000) // 2 seconds (simulating work like downloading image files)
    print("2. I'm in the background queue")
}

queue.sync {
    usleep(3_000_000) // Pretend we're downloading an image
    print("When does this happen?")
}

print("3. I'm not being blocked")

queue.async {   // async means: don't wait to complete, start it sometime in the future
    usleep(1_000_000) // 1 second
    print("4. I'm doing more work in the background")
}

print("5. I'm not being blocked")



//: [Next](@next)
