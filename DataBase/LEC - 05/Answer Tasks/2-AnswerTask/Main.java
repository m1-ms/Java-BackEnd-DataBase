import Relationship.Doctor;
import Relationship.Patient;

import java.util.ArrayList;
import java.util.List;

public class Main {
    public static void main(String[] args) {

        // Doctor
        Doctor doctor1 = new Doctor();
        doctor1.id = 1L;
        doctor1.name = "Mohamed";
        doctor1.salary = 1000.0;

        Doctor doctor2 = new Doctor();
        doctor2.id = 2L;
        doctor2.name = "Ali";
        doctor2.salary = 2000.0;

        // Patient
        Patient patient1 = new Patient();
        patient1.id = 1L;
        patient1.name = "Ahmed";
        patient1.age = 45;

        Patient patient2 = new Patient();
        patient2.id = 2L;
        patient2.name = "Ayman";
        patient2.age = 55;

        // Doctor > Patients
        List<Patient> doctorPatients = new ArrayList<>();
        doctorPatients.add(patient1);
        doctorPatients.add(patient2);
        doctor1.patients = doctorPatients;
        doctor2.patients = doctorPatients;

        // Patient > Doctors
        List<Doctor> patientDoctors = new ArrayList<>();
        patientDoctors.add(doctor1);
        patientDoctors.add(doctor2);
        patient1.doctors = patientDoctors;
        patient2.doctors = patientDoctors;

        System.out.println(doctor1.patients.get(0).name);
        System.out.println(doctor2.patients.get(1).name);
        System.out.println(" ----------------------------------- ");
        System.out.println(patient1.doctors.get(1).name);
        System.out.println(patient2.doctors.get(0).name);

    }
}