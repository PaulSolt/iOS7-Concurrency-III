//: [Previous](@previous)

import Foundation

// StarWars API
let urls = [
    URL(string: "https://swapi.co/api/people/1/")!,
    URL(string: "https://swapi.co/api/people/2/")!,
    URL(string: "https://swapi.co/api/people/3/")!,
    URL(string: "https://swapi.co/api/people/4/")!
]

var peopleGroup = DispatchGroup()
var networkingGroup = DispatchGroup()

extension DispatchGroup {
    
    func enter(times: Int) {
        for _ in 0 ..< times { enter() }
    }
}

for personURL in urls {
    peopleGroup.enter(times: 1)
    networkingGroup.enter(times: 3)
    
    let task = URLSession.shared.dataTask(with: personURL) { (data, _, _) in
        // do stuff with data
        print("Got data for \(personURL): \(String(describing: data))")
        
        networkingGroup.leave()
        networkingGroup.leave()
        networkingGroup.leave()   // QUESTION: What happens if you comment out this line?
        peopleGroup.leave()
    }
    task.resume()
}

// Notify allows us to not block the main thread

peopleGroup.notify(queue: .main) {
    print("peopleGroup: All people are downloaded!")
//    tableView.reloadData()
}

networkingGroup.notify(queue: .main) {
    print("networkingGroup: Networking has completed")
}


//: [Next](@next)
