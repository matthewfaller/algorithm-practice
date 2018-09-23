# Algorithms & Data Structures

[![Build Status](https://travis-ci.com/matthewfaller/algorithm-practice.svg?branch=develop)](https://travis-ci.com/matthewfaller/algorithm-practice)

[![docs](https://img.shields.io/badge/read_the-docs-2196f3.svg)](https://matthewfaller.github.io/algorithm-practice/)

Programming practice implemented in Swift

## Running The Project

```bash
git clone https://github.com/matthewfaller/algorithm-practice
```

```bash
cd algorithm-practice/
```

```bash
swift test
```

### Linked List

A simple implementation of a classic structure

```swift
let list = LinkedList<String>()
list.append("Hello")
list.append("World!")
```

Conforms to the `Sequence` Protocol

```swift
let numbers: LinkedList = [1, 2, 3, 4]

let factorial = numbers.reduce(1, *)

print(factorial)

24
```

Uses generics

```swift
struct User: Codable, Hashable {
    let id: String
    let name: String
}

let users: LinkedList = [
    User(id: "1", name: "Emily Blunt"), 
    User(id: "2", name: "John Krasinski") 
]

users.filter(isActor).forEach(updateUser)
```