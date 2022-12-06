//
//  main.swift
//  MyCreditManager_jkim68888
//
//  Created by 김지현 on 2022/12/05.
//

import Foundation

struct StudentsGrade {
	var student: String
	var gradeInfo: [GradeInfo]
}

struct GradeInfo {
	var subject: String
	var grade: Grade
	var score: Double
}

enum Grade: String {
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
		} else if studentsGrades.contains(where: { $0.student == userInput }) {
			print("\(userInput)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
			print("⭐️",studentsGrades)
			selectMenu()
		} else {
			studentsGrades.append(StudentsGrade(student: userInput, gradeInfo: []))
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
		} else if studentsGrades.contains(where: { $0.student == userInput }) {
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
	print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A0, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
	
	if let userInput = readLine() {
		let inputArray = userInput.split(separator: " ")
		print("📍",inputArray)
		var grade: Grade = .F
		var score: Double = 0.0
		
		if userInput == "" || inputArray.count != 3 {
			print(inputWraning)
			selectMenu()
		} else if studentsGrades.contains(where: { $0.student == inputArray[0] }) {
			switch inputArray[2] {
			case "A+":
				grade = .A
				score = 4.5
			case "A0":
				grade = .A0
				score = 4.0
			case "B+":
				grade = .B
				score = 3.5
			case "B0":
				grade = .B0
				score = 3.0
			case "C+":
				grade = .C
				score = 2.5
			case "C0":
				grade = .C0
				score = 2.0
			case "D+":
				grade = .D
				score = 1.5
			case "D0":
				grade = .D0
				score = 1.0
			case "F":
				grade = .F
				score = 0.0
			default:
				print(inputWraning)
				selectMenu()
			}
			
			if let index = studentsGrades.firstIndex(where: { $0.student == inputArray[0] }) {
				var gradeInfo = studentsGrades.map { $0.gradeInfo }[index]
				
				if let idx = gradeInfo.firstIndex(where: { $0.subject == inputArray[1] }) {
					gradeInfo[idx] = GradeInfo(subject: String(inputArray[1]), grade: grade, score: score)
				} else {
					gradeInfo.append(GradeInfo(subject: String(inputArray[1]), grade: grade, score: score))
				}
				
				print("📍",gradeInfo)
				
				studentsGrades[index].gradeInfo = gradeInfo
			}
		
			print("\(inputArray[0]) 학생의 \(inputArray[1]) 과목이 \(inputArray[2])로 추가(변경)되었습니다.")
			print("⭐️",studentsGrades)
			selectMenu()
		} else {
			print(inputWraning)
			print("⭐️",studentsGrades)
			selectMenu()
		}
	}
}

func deleteScore() {
	print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift")
	
	if let userInput = readLine() {
		let inputArray = userInput.split(separator: " ")
		print("📍",inputArray)
		
		if userInput == "" || inputArray.count != 2 {
			print(inputWraning)
			selectMenu()
		} else if studentsGrades.contains(where: { $0.student == inputArray[0] }) {
			if let index = studentsGrades.firstIndex(where: { $0.student == inputArray[0] }) {
				var gradeInfo = studentsGrades.map { $0.gradeInfo }[index]
				
				if let idx = gradeInfo.firstIndex(where: { $0.subject == inputArray[1] }) {
					print("📍",gradeInfo[idx])
					
					gradeInfo.remove(at: idx)
				}
			
				studentsGrades[index].gradeInfo = gradeInfo
			}
			
			print("\(inputArray[0]) 학생의 \(inputArray[1]) 과목의 성적이 삭제되었습니다.")
			print("⭐️",studentsGrades)
			selectMenu()
		} else {
			print("\(inputArray[0]) 학생을 찾지 못했습니다.")
			print("⭐️",studentsGrades)
			selectMenu()
		}
	}
}

func getGrade() {
	print("평점을 알고싶은 학생의 이름을 입력해주세요")

	var sumOfScore: Double = 0.0
	var averageScore: Double = 0.0
	
	if let userInput = readLine() {
		if userInput == "" {
			print(inputWraning)
			selectMenu()
		} else if studentsGrades.contains(where: { $0.student == userInput }) {
			if let index = studentsGrades.firstIndex(where: { $0.student == userInput }) {
				let gradeInfo = studentsGrades.map { $0.gradeInfo }[index]
				
				gradeInfo.forEach {
					var grade: String = "F"
					
					switch $0.grade {
					case .A:
						grade = "A+"
					case .A0:
						grade = "A0"
					case .B:
						grade = "B+"
					case .B0:
						grade = "B0"
					case .C:
						grade = "C+"
					case .C0:
						grade = "C0"
					case .D:
						grade = "D+"
					case .D0:
						grade = "D0"
					case .F:
						grade = "F"
					}
					
					print("\($0.subject): \(grade)")
				
					sumOfScore += $0.score
				}
				
				averageScore = sumOfScore / Double(gradeInfo.count)
				
				print("평점 : \(averageScore)")
			}
			print("⭐️",studentsGrades)
			selectMenu()
		} else {
			print("\(userInput) 학생을 찾지 못했습니다.")
			print("⭐️",studentsGrades)
			selectMenu()
		}
	}
}

func endProgram() {
	
}

func menuWarning() {
	print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
	selectMenu()
}

selectMenu()
