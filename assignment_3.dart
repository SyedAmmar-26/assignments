int i = 0;
void main() {
  List<Map<String, String>> Students = [
    {
      "Id": "20k-1001",
      "First_Name": "Ali",
      "Last_Name": "Ahmed",
      "F_Name": "Manzoor Ahmed",
      "email": "ali.ahmed@outlook.com",
      "Grade": "4"
    },
    {
      "Id": "20k-1002",
      "First_Name": "Ghaffar",
      "Last_Name": "Ahmed",
      "F_Name": "Manzoor Ahmed",
      "email": "ali.ahmed@outlook.com",
      "Grade": "4"
    },
    {
      "Id": "20k-1003",
      "First_Name": "Saleem",
      "Last_Name": "Ghufraan",
      "F_Name": "Ghufraan Ahmed",
      "email": "ghufraan.ahmed@gmail.com",
      "Grade": "4"
    },
    {
      "Id": "20k-1004",
      "First_Name": "Razzaq",
      "Last_Name": "Rafique",
      "F_Name": "Rafique Ahmed",
      "email": "razzaq.rafique@outlook.com",
      "Grade": "4"
    },
    {
      "Id": "20k-1005",
      "First_Name": "Atif",
      "Last_Name": "Tahir",
      "F_Name": "Tahir Iftikhar",
      "email": "atif.taheer@ku.edu.pk",
      "Grade": "4"
    }
  ];
  for (int i = 0; i < Students.length; i++) {
    display(Students[i]);
  }
}

void display(var std) {
  i++;
  print("\n\n\t\t\tStudent Number $i");
  print("\nStudent Id = " + std["Id"] + "\n");
  print("First Name = " + std["First_Name"] + "\n");
  print("Last Name = " + std["Last_Name"] + "\n");
  print("Father Name = " + std["F_Name"] + "\n");
  print("Email Address = " + std["email"] + "\n");
  print("Grade = " + std["Grade"] + "\n");
}
