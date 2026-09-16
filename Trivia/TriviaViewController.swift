//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Everett Matthew Pohl on 9/14/26.
//

import UIKit

class TriviaViewController: UIViewController {
    @IBOutlet weak var questionCount: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var questionBox: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    
    @IBAction func didTapAnswer1(_ sender: Any) {
        if (questions[currentQuestion].correct == 0) {
            score += 1
        }
        nextQuestion()
    }
    
    @IBAction func didTapAnswer2(_ sender: Any) {
        if (questions[currentQuestion].correct == 1) {
            score += 1
        }
        nextQuestion()
    }
    
    @IBAction func didTapAnswer3(_ sender: Any) {
        if (questions[currentQuestion].correct == 2) {
            score += 1
        }
        nextQuestion()
    }
    
    @IBAction func didTapAnswer4(_ sender: Any) {
        if (questions[currentQuestion].correct == 3) {
            score += 1
        }
        nextQuestion()
    }
    
    private var questions = [Trivia]()
    private var currentQuestion = 0
    private var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = makeQuestions()
        configure(with: questions[currentQuestion])
    }
    
    private func makeQuestions() -> [Trivia] {
        let question1 = Trivia(
            question: "In what year did World War II end?",
            category: .history,
            answers: ["1943", "1945", "1947", "1950"],
            correct: 1
        )
        let question2 = Trivia(
            question: "What is the chemical symbol for gold?",
            category: .science,
            answers: ["Ag", "Fe", "Au", "Pb"],
            correct: 1
        )
        let question3 = Trivia(
            question: "Which studio produced the movie 'Toy Story'?",
            category: .entertainment,
            answers: ["DreamWorks", "Pixar", "Illumination", "Warner Bros."],
            correct: 1
        )
        let question4 = Trivia(
            question: "Which social media platform introduced the 280-character limit for posts, up from 140?",
            category: .news,
            answers: ["Instagram", "Facebook", "Twitter/X", "TikTok"],
            correct: 2
        )
        return [question1, question2, question3, question4]
    }
    
    private func configure(with question: Trivia) {
        questionCount.text = "Question #\(currentQuestion + 1)/\(questions.count)"
        category.text = question.category.rawValue
        questionBox.text = question.question
        answer1.setTitle(question.answers[0], for: .normal)
        answer2.setTitle(question.answers[1], for: .normal)
        answer3.setTitle(question.answers[2], for: .normal)
        answer4.setTitle(question.answers[3], for: .normal)
    }
    
    private func nextQuestion() {
        if (currentQuestion < questions.count-1) {
            currentQuestion += 1
            configure(with: questions[currentQuestion])
        } else {
            let alert = UIAlertController(
                title: "Game Over!",
                message: "Score: \(score)/\(questions.count)",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Restart Game", style: .default) { _ in
                self.score = 0
                self.currentQuestion = 0
                self.configure(with: self.questions[self.currentQuestion])
            })
            present(alert, animated: true)
        }
    }
}
