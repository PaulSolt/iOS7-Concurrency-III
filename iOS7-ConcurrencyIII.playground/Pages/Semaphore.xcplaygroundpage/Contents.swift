//: [Previous](@previous)

import Foundation

func download(url: URL) -> Data? {
    var data: Data? = nil
    let semaphore = DispatchSemaphore(value: 0)
    
    URLSession.shared.dataTask(with: url) { (theData, _, _) in
        print("downloaded \(String(describing: theData))")
        data = theData
        semaphore.signal()
    }.resume()
    
    semaphore.wait() // This will block, until we have a response in the URLSession dataTask
    
    return data
}

print("About to wait for luke to download")

let url = URL(string: "https://swapi.co/api/people/1/")!
if let myData = download(url: url) {
    print("Downloaded: \(myData)")
} else {
    print("data was nil")
}

print("Luke has finished downloading")


//: [Next](@next)
