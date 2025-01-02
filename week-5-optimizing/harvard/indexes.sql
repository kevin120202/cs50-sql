CREATE INDEX search_student_by_id
ON students(id);

CREATE INDEX idx_enrollments_student_id
ON enrollments(student_id);

CREATE INDEX idx_enrollments_course_id
ON enrollments(course_id);

CREATE INDEX search_courses_by_semester
ON courses(semester);

CREATE INDEX idx_satisfies_course_id
ON satisfies(course_id);
