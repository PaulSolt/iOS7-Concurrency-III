//: [Previous](@previous)

import Foundation

func download(url: URL) -> Data? {
    
}

print("About to wait for luke to download")

let url = URL(string: "https://swapi.co/api/people/1/")!
if let myData = download(url: url) {
    print("Downloaded: \(myData)")
}

print("Luke has finished downloading")


//: [Next](@next)
