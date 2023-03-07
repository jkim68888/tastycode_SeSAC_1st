# tastycode_SeSAC_1st

## 학생 성적 테이블 관리하기

![스크린샷 2023-03-07 오전 10 48 59](https://user-images.githubusercontent.com/75922558/223298254-1fab21fc-281b-423f-9ba9-adda8ec05a88.png)

### 기능
- 학생 추가, 삭제
- 성적 추가, 변경, 삭제
- 학생의 성적 평점 보기

<br/>

### 학생 성적 데이터를 Codable을 사용하여 모델로 저장하여 관리

#### Model
```Swift
struct StudentsGrade: Codable {
	var student: String
	var gradeInfo: [GradeInfo]
	
	enum CodingKeys: String, CodingKey {
		case student
		case gradeInfo
	}
}

struct GradeInfo: Codable {
	var subject: String
	var grade: Grade
	var score: Double
	
	enum CodingKeys: String, CodingKey {
		case subject
		case grade
		case score
	}
}

enum Grade: String, Codable {
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
```
<br/>

#### 모델에 저장된 데이터를 Decode한 형태

![스크린샷 2023-03-07 오전 10 36 29](https://user-images.githubusercontent.com/75922558/223297240-493136c8-bfd9-4c34-a7c5-8508099ca650.png)


```JSON
[
    {
        "student": "sandy",
        "gradeInfo": [
            {
                "subject": "swift",
                "grade": "A+",
                "score": 4.5
            },
            {
                "subject": "python",
                "grade": "B0",
                "score": 3.0,
            },
            {
                "subject": "html",
                "grade": "F0",
                "score": 0.0,
            }
        ]
    },
    {
        "student": "mickey",
        "gradeInfo": [
            {
                "subject": "java",
                "grade": "F0",
                "score": 0.0,
            }
        ]
    }
]
```


