//
//  main.swift
//  MyCreditManager_jkim68888
//
//  Created by 김지현 on 2022/12/05.
//

import Foundation

struct StudentsGrade {
	var student: String
	var subject: String
	var score: Score
	var grade: Int
}

enum Score: String {
	case A
	case A0
	case B
	case B0
	case C
	case C0
	case D
	case D0
	case F
}

let menu = "원하는 기능을 입력해주세요\n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료"
let inputWraning = "입력이 잘못되었습니다. 다시 확인해주세요."

var studentsGrades: [StudentsGrade] = []

func selectMenu() {
	print(menu)
	
	if let userInput = readLine() {
		switch userInput {
		case "1":
			addStudent()
		case "2":
			deleteStudent()
		case "3":
			addScore()
		case "4":
			deleteScore()
		case "5":
			getGrade()
		case "X":
			endProgram()
		default:
			menuWarning()
		}
	}
}

func addStudent() {
	print("추가할 학생의 이름을 입력해주세요")

	if let userInput = readLine() {
		if userInput == "" {
			print(inputWraning)
			selectMenu()
		} else if studentsGrades.contains(where: { StudentsGrade in
			StudentsGrade.student == userInput
		}) {
			print("\(userInput)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
			print("⭐️",studentsGrades)
			selectMenu()
		} else {
			studentsGrades.append(StudentsGrade(student: userInput, subject: "", score: .F, grade: 0))
			print("\(userInput) 학생을 추가했습니다.")
			print("⭐️",studentsGrades)
			selectMenu()
		}
	}
}

func deleteStudent() {
	print("삭제할 학생의 이름을 입력해주세요")
	
	if let userInput = readLine() {
		if userInput == "" {
			print(inputWraning)
			selectMenu()
		} else if studentsGrades.contains(where: { StudentsGrade in
			StudentsGrade.student == userInput
		}) {
			studentsGrades = studentsGrades.filter { $0.student != userInput }
			print("\(userInput) 학생을 삭제하였습니다.")
			print("⭐️",studentsGrades)
			selectMenu()
		} else {
			print("\(userInput) 학생을 찾지 못했습니다.")
			print("⭐️",studentsGrades)
			selectMenu()
		}
	}
}

func addScore() {
	
}

func deleteScore() {
	
}

func getGrade() {
	
}

func endProgram() {
	
}

func menuWarning() {
	print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
	selectMenu()
}

selectMenu()
