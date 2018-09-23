# Algorithms & Data Structures

[![Build Status](https://travis-ci.com/matthewfaller/algorithm-practice.svg?branch=develop)](https://travis-ci.com/matthewfaller/algorithm-practice)

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
let numbers = LinkedList(of: 1, 2, 3, 4)

let factorial = numbers.reduce(1, *)

print(factorial)

24
```