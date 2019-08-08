//: [Previous](@previous)

import Foundation

func download(url: URL) -> Data? {
    var data: Data? = nil
    let semaphore = DispatchSemaphore(value: 0)
    
    URLSession.shared.dataTask(with: url) { (theData, _, _) in
        print("URLSession.downloaded \(String(describing: theData))")
        data = theData
        semaphore.signal()
    }.resume()
    
    semaphore.wait() // This will block, until we have a response in the URLSession dataTask
    
    return data
}

print("About to wait for luke to download")

// We have used a semaphore, like the DispatchGroup, to notify us when the data is downloaded
// This is turning an asyncrhonous operation into a synchronous operation

let url = URL(string: "https://swapi.co/api/people/1/")!
if let myData = download(url: url) {
    print("Downloaded: \(myData)")
} else {
    print("data was nil")
}

print("Luke has finished downloading")


//: [Next](@next)
