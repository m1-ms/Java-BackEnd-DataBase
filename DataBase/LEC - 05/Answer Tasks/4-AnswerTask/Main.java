import Relationship.Employee;
import Relationship.Phone;

public class Main {

    public static void main(String[] args) {

        Employee employee = new Employee();
        employee.id = 1L;
        employee.name = "Ahmed";
        employee.age = 25;

        Employee employee1 = new Employee();
        employee1.id = 2L;
        employee1.name = "Mohamed";
        employee1.age = 32;

        Phone phone = new Phone();
        phone.id = 1L;
        phone.phoneNumber = "01012345678";

        Phone phone1 = new Phone();
        phone1.id = 2L;
        phone1.phoneNumber = "01012566666";

        // Employee > Phone
        employee.phone = phone;
        employee1.phone = phone1;

        // Phone > Employee
        phone.employee = employee;
        phone1.employee = employee1;

        System.out.println(employee.phone.phoneNumber);
        System.out.println(phone.employee.name);
        System.out.println(" ------------------------------ ");
        System.out.println(employee1.phone.phoneNumber);
        System.out.println(phone1.employee.name);
    }
}