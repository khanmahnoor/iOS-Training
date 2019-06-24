//INITIALIZATION

class BlogPost {
    var title:String?
    var body:String = "hy"
    var author:String?
    var noOfComments = 0
    
    convenience init(body: String, title: String, author: String, cts: Int) {
        self.init()
        self.title = title
        self.body = body
        self.author = author
        noOfComments = cts
    }
}

//var post = BlogPost(body: "What a beautiful weather.")
//post.title = "my title"
//post.noOfComments = 15
//post.author = "my author"

var mypost = BlogPost(body: "body", title: "title", author: "author", cts: 5)



class myPost: BlogPost {
    var noOfPosts : Int
    override init() {
        self.noOfPosts = 0
        super.init()
    }

    convenience init(noOfPosts:Int) {
        self.init()
        self.noOfPosts = noOfPosts
    }

}

var m = myPost(noOfPosts: 2)
print(m.body)
//if let title = post.title  {
//    print(title + " " + post.body)
//}
//else {
//     print("lool title has no value")
//}

struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty { return nil }
        self.species = species
    }
}

let x = Animal(species: "")

class Document {
    var name: String?
    init() {}
    init?(name: String) {
        if name.isEmpty { return nil }
        self.name = name
    }
}

class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}

//DEINITIALIZATION

//ERROR HANDLING

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

throw VendingMachineError.insufficientFunds(coinsNeeded: 5)

