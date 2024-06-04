import List "mo:base/List";
import D "mo:base/Debug";
actor scholarshipChecker{
  type Student = {
    firstname: Text;
    lastname: Text;
    age: Nat;
    currentClass: Class;
    gender:Gender;
  };
  type Gender ={
    #Female;
    #Male;
  };
  type Class= {
    #Firstclass;
    #Secondclass;
    #Thirdclass;
  };
 //make a new list of type students
  var studentDatabase = List.nil<Student>();
  public query func getAllStudents(): async List.List<Student>{
    return studentDatabase;
  };
  public query func getAllStudentsByClass(currentClass:Class): async List.List<Student>{
    let selectedStudents = List.filter<Student>(
      studentDatabase, 
      func student { 
        if(student.currentClass == currentClass and student.age>=16){
          return true;
        }else{
          return false;
        }
      }
      
    );
    return selectedStudents;
};
public query func getNumberOfStudents(): async Nat{
    List.size<Student>(studentDatabase);
  };
public func addNewStudent(student:Student): async Text {
    let newList = List.push<Student>(student,studentDatabase);
    studentDatabase := newList;
    return "succesfully added student";
  }
}

