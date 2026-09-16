//
//  Trivia.swift
//  Trivia
//
//  Created by Everett Matthew Pohl on 9/14/26.
//

struct Trivia {
    let question: String
    let category: Category
    let answers: [String]
    let correct: Int
}

enum Category: String {
    case history = "History"
    case science = "Science"
    case entertainment = "Entertainment"
    case news = "News"
}
