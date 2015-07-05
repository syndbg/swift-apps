//: Playground - noun: a place where people can play

import Cocoa

func isPrime(number: Int) -> Bool {
    if number < 2 {
        return false
    }

    for var i = 2; i <= number; i++ {
        if number % i == 0 {
            return false
        }
    }

    return true
}

var i = 1
while i <= 6 {
    if i > 4 {
        println(3*i)
    }
    i++
}
i