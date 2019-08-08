//: [Previous](@previous)

import Foundation

let queue = OperationQueue()
queue.maxConcurrentOperationCount = 1 // Serial Queue

let downloadProfileJSON = BlockOperation {
    sleep(1)
    print("1. downloadProfileJSON")
}

let processJSON = BlockOperation {
    sleep(1)
    print("2. processJSON")
}

let downloadProfileImage = BlockOperation {
    sleep(1)
    print("3. downloadProfileImage")
}

// Create dependencies

processJSON.addDependency(downloadProfileJSON)
downloadProfileImage.addDependency(processJSON)

//queue.addOperations([downloadProfileJSON, processJSON, downloadProfileImage], waitUntilFinished: false)
print("Finished")



let heartRate = MyHeartRateOperation(deviceName: "Polar H10")

queue.addOperation(heartRate)

queue.addOperation(downloadProfileImage)
queue.addOperation(processJSON)
queue.addOperation(downloadProfileJSON)

usleep(100)
print("Cancel")
heartRate.cancel()

//processJSON.cancel()
//queue.cancelAllOperations()

// Create a custom Operation

class MyHeartRateOperation: Operation {
    private var deviceName: String
    init(deviceName: String) {
        self.deviceName = deviceName
    }
    
    override func main() {
        // do all of our background work
        // processing data, downloading data via Bluetooth
        if !isCancelled {

            var i = 0
            while i < 10 {
                // do the work
                usleep(100)
                i += 1
                
                if isCancelled {
                    print("HeartRate Cancel: Exit early")
                    return // exit early, discard results, stop bluetooth communication
                }
            }
            
            print("4. Get Heart Rate data")
            

        } else {
            print("HeartRate Canceled!")
        }
    }
}






//: [Next](@next)
