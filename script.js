const students = [
  { id: 1, name: "Amit", marks: 78, department: "CSE" },
  { id: 2, name: "Priya", marks: 92, department: "ECE" },
  { id: 3, name: "Rahul", marks: 45, department: "MECH" },
  { id: 4, name: "Sneha", marks: 66, department: "CSE" },
  { id: 5, name: "Kiran", marks: 88, department: "ECE" },

  { id: 6, name: "Neha", marks: 55, department: "CSE" },
  { id: 7, name: "Arjun", marks: 34, department: "MECH" },
  { id: 8, name: "Ravi", marks: 72, department: "ECE" },
  { id: 9, name: "Pooja", marks: 81, department: "CSE" },
  { id: 10, name: "Manoj", marks: 49, department: "MECH" },
  { id: 11, name: "Divya", marks: 90, department: "ECE" },
  { id: 12, name: "Suresh", marks: 64, department: "CSE" },
  { id: 13, name: "Anjali", marks: 58, department: "ECE" },
  { id: 14, name: "Vikas", marks: 39, department: "MECH" },
  { id: 15, name: "Meena", marks: 75, department: "CSE" }
];


// 1. Display all student names 
const studentList = document.getElementById("studentList");

students.forEach(student => {
  const li = document.createElement("li");
  li.textContent = student.name;

  // Highlight failed students
  if (student.marks < 50) {
    li.classList.add("failed");
  }

  studentList.appendChild(li);
});


// 2. Students with marks > 60 
const above60List = document.getElementById("above60List");

students
  .filter(student => student.marks > 60)
  .forEach(student => {
    const li = document.createElement("li");
    li.textContent = `${student.name} - ${student.marks}`;
    above60List.appendChild(li);
  });


// 3. Department count 
const departmentCount = {};

students.forEach(student => {
  departmentCount[student.department] =
    (departmentCount[student.department] || 0) + 1;
});

const departmentList = document.getElementById("departmentCount");

for (let dept in departmentCount) {
  const li = document.createElement("li");
  li.textContent = `${dept}: ${departmentCount[dept]}`;
  departmentList.appendChild(li);
}


// 4. Highest marks 
const topper = students.reduce((max, student) =>
  student.marks > max.marks ? student : max
);

document.getElementById("topper").textContent =
  `${topper.name} scored highest with ${topper.marks} marks`;


// 5. Display students in table 
const tableBody = document.getElementById("studentTable");

students.forEach(student => {
  const row = document.createElement("tr");

  //  for students failed
  if (student.marks < 50) {
    row.style.color = "red";
  }

  row.innerHTML = `
    <td>${student.name}</td>
    <td>${student.marks}</td>
    <td>${student.department}</td>
  `;

  tableBody.appendChild(row);
});


// 6. Average marks 
const totalMarks = students.reduce((sum, student) => sum + student.marks, 0);
const average = (totalMarks / students.length).toFixed(2);

document.getElementById("averageMarks").textContent =
  `Average Marks: ${average}`;


// 7. Only CSE students */
const cseList = document.getElementById("cseStudents");

students
  .filter(student => student.department === "CSE")
  .forEach(student => {
    const li = document.createElement("li");
    li.textContent = student.name;
    cseList.appendChild(li);
  });


// 8. Sort by marks (descending) 
const sortedList = document.getElementById("sortedStudents");

[...students]
  .sort((a, b) => b.marks - a.marks)
  .forEach(student => {
    const li = document.createElement("li");
    li.textContent = `${student.name} - ${student.marks}`;
    sortedList.appendChild(li);
  });


// 9. Add new student 
const newStudent = { id: 16, name: "Rohit", marks: 83, department: "ECE" };
students.push(newStudent);

const newLi = document.createElement("li");
newLi.textContent = newStudent.name;
studentList.appendChild(newLi);
