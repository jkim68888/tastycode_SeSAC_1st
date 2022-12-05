//
//  main.swift
//  MyCreditManager_jkim68888
//
//  Created by 김지현 on 2022/12/05.
//

import Foundation

let menu = "원하는 기능을 입력해주세요\n1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료"
let menuWarning = "뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요."

print(menu)
	
while true {
	if let userInput = readLine() {
		
		if userInput == "1" {
			print("추가할 학생의 이름을 입력해주세요")
		} else if userInput == "2" {
			print("학제할 학생의 이름을 입력해주세요")
		} else if userInput == "3" {
			print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A0, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift A+\n만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
		} else if userInput == "4" {
			print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.\n입력예) Mickey Swift")
		} else if userInput == "5" {
			print("평점을 알고싶은 학생의 이름을 입력해주세요.")
		} else if userInput == "X" {
			print("프로그램을 종료합니다...")
			break
		} else {
			print(menuWarning)
		}
	
	}
}
