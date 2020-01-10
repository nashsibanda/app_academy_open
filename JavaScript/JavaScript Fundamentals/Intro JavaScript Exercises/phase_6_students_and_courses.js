function Student(fName, lName) {
  this.fName = fName;
  this.lName = lName;
  this.courses = [];
}

Student.prototype.name = function () {
  return this.fName + " " + this.lName;
}

Student.prototype.enroll = function (course) {
  if (this.hasConflict(course)) {
    return Error('This course conflicts with another that this student is enrolled on.')
  } else {
    this.courses.push(course);
    course.addStudent(this);
  }
}

Student.prototype.hasConflict = function (otherCourse) {
  if (this.courses.some(course => course.conflictsWith(otherCourse))) {
    return true
  }
}

Student.prototype.courseLoad = function () {
  let handler = {
    get: function (target, name) {
      return target.hasOwnProperty(name) ? target[name] : 0;
    }
  };

  let courseLoadHash = new Proxy({}, handler);
  this.courses.forEach(course => {
    courseLoadHash[course.department] += course.credits;
  })
  return courseLoadHash;
}

function Course(courseName, department, credits, daysOfWeek, timeBlock) {
  this.courseName = courseName;
  this.department = department;
  this.credits = credits;
  this.students = [];
  this.daysOfWeek = daysOfWeek;
  this.timeBlock = timeBlock;
}

Course.prototype.addStudent = function (student) {
  this.students.push(student);
}

Course.prototype.conflictsWith = function (course) {
  if (course.timeBlock === this.timeBlock) {
    if (this.daysOfWeek.some(day => course.daysOfWeek.includes(day))) {
      return true;
    }
  }
  return false;
}