pragma solidity ^0.4.0;


contract GradeRecord {
 
    struct Student {
        string name;    // 名稱
        int grade;      // 成績
        
    }

    Student[] students; 
    
    
    // 輸入學生成績, 分數
    function inputGradeWithStudentName(string name, int grade) {
        Student memory newStudent = Student({name: name, grade: grade});
        students.push(newStudent);
    }
    
    // 取得總學生筆數
    function getStudentCount() constant returns (uint) {
        return students.length;
    }
    
    // 取得第index個的學生成績
    function getStudentNameAt(uint index) constant returns (string) {
        Student memory didSelectStudent = students[index];
        return didSelectStudent.name;
    }
    
    // 取得指定的學生的成績, 無法取得則回傳-1
    function getScoreWithStudentName(string name) constant returns (int) {
        for (uint i = 0; i < students.length; i++) {
            
            if (keccak256(students[i].name) == keccak256(name)) {
                return students[i].grade;
            }
        }
        return -1;
    }
    
    
    
}