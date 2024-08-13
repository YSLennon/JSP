package controller;
import com.google.gson.Gson;

public class GsonExample {
    public static void main(String[] args) {
        // Gson 객체 생성
        Gson gson = new Gson();
        
        // 예제 객체 생성
        Person person = new Person("John", "Doe", 30);
        
        // 객체를 JSON 문자열로 변환
        String json = gson.toJson(person);
        System.out.println("JSON: " + json);
        
        // JSON 문자열을 객체로 변환
        Person personFromJson = gson.fromJson(json, Person.class);
        System.out.println("Person: " + personFromJson);
    }
}

class Person {
    private String firstName;
    private String lastName;
    private int age;
    
    public Person(String firstName, String lastName, int age) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.age = age;
    }

//    @Override
//    public String toString() {
//        return "Person [firstName=" + firstName + ", lastName=" + lastName + ", age=" + age + "]";
//    }
}