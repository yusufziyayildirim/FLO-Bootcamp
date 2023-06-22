//
//  Author.swift
//  Odev8
//
//  Created by Yusuf Ziya YILDIRIM on 22.06.2023.
//

import Foundation

enum Gender{
  case male
  case female
}

struct Author{
  let name: String
  let gender: Gender
}


let authors = [
  Author(name: "Lady Gaga", gender: .female),
  Author(name: "Marilyn Monroe", gender: .female),
  Author(name: "Hank Aaron", gender: .male),
  Author(name: "Winston Churchill", gender: .male),
  Author(name: "Walt Disney", gender: .male),
  Author(name: "Laura Ingalls Wilder", gender: .female),
  Author(name: "John Quincy Adams", gender: .male),
  Author(name: "Ernest Hemingway", gender: .male),
  Author(name: "Franklin D. Roosevelt", gender: .male),
  Author(name: "Maya Angelou", gender: .female),
  Author(name: "Steve Jobs", gender: .male),
  Author(name: "Oprah Winfrey", gender: .female),
  Author(name: "Barack Obama", gender: .male),
  Author(name: "Mae West", gender: .female),
  Author(name: "Napoleon Hill", gender: .female),
  Author(name: "Stan Lee", gender: .male),
  Author(name: "Tony Gaskins", gender: .male),
  Author(name: "Tony Robbins", gender: .male),
  Author(name: "Zig Ziglar", gender: .male),
  Author(name: "J.M. Power", gender: .male),
  Author(name: "George Lucas", gender: .male),
  Author(name: "Albert Einstein", gender: .male),
  Author(name: "Jimmy Dean", gender: .male),
  Author(name: "Will Rogers", gender: .male),
  Author(name: "George Eliot", gender: .female),
  Author(name: "Albert Camus", gender: .male),
  Author(name: "Michael Jordan", gender: .male),
  Author(name: "Martin Luther King Jr.", gender: .male),
  Author(name: "Nelson Mandela", gender: .female),
  Author(name: "F. Scott Fitzgerald", gender: .male),
  Author(name: "Lao Tzu", gender: .male),
  Author(name: "Robert Louis Stevenson", gender: .male),
  Author(name: "Theodore Roosevelt", gender: .female),
  Author(name: "Helen Keller", gender: .female)
]
