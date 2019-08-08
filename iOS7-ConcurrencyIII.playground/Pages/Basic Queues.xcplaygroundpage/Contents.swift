import Foundation

//let queue = DispatchQueue.global()
//
//print("1. I'm on the main thread")
//
//queue.async { // sync is a blocking operation
//    usleep(3_000_000) // Pretend we're downloading an image
//    print("When does this happen?")
//}
//
//queue.async {
//    usleep(2_000_000) // 2 seconds (simulating work like downloading image files)
//    print("2. I'm in the background queue")
//}
//
//print("3. I'm not being blocked")
//
//queue.sync {   // async means: don't wait to complete, start it sometime in the future
//    usleep(1_000_000) // 1 second
//    print("4. I'm doing more work in the background")
//}
//
//print("5. I'm not being blocked")

//let serialQueue = DispatchQueue(label: "MySerialQueue")
//
//print("Start serial queue")
//
//serialQueue.async {
//    usleep(1_000_000)
//    print("1. Do this first")
//}
//
//serialQueue.async {
//    usleep(1_000_000)
//    print("2. Do this second")
//}
//
//serialQueue.sync {  // Sync is a blocking call
//    usleep(1_000_000)
//    print("3. Do this third")
//}
//
//print("4. Done")

// Concurrent Queue

//DispatchQueue defaults to Serial (1 at a time when we create it, so by making it concurrent, we can do multiple things)
let downloadPhotoQueue = DispatchQueue(label: "MyConcurrentQueue", attributes: .concurrent)

for i in 0...100 {
    downloadPhotoQueue.async {
        print("Download Photo \(i)")
    }
}


//: [Next](@next)
