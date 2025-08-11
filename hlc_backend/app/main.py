from fastapi import FastAPI, Depends, HTTPException
from fastapi.middleware.cors import CORSMiddleware
import app.models
from app.crud import course as course_crud, student as student_crud
from sqlalchemy.orm import Session
from app.database import engine, SessionLocal, Base, get_db # если используешь engine
from app.routers import course
from app.schemas.course import CourseBase, CourseCreate, CourseInDB, CourseRead
from app.schemas import student as student_schema
from app.routers import admins


# from app import models  # если есть модели


Base.metadata.create_all(bind=engine)

app = FastAPI()
app.include_router(course.router)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:5173"],  # Адрес твоего фронтенда
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
def read_root():
    return {"message": "API is working!"}

@app.post("/courses/", response_model=CourseInDB)
def create_new_course(course: CourseCreate, db: Session = Depends(get_db)):
    return course_crud.create_course(db, course)

@app.get("/courses/", response_model=list[CourseInDB])
def read_courses(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    return course_crud.get_courses(db, skip=skip, limit=limit)

@app.post("/students/", response_model=student_schema.Student)
def create_student(student: student_schema.StudentCreate, db: Session = Depends(get_db)):
    return student_crud.create_student(db, student)

@app.get("/students/", response_model=list[student_schema.Student])
def read_students(skip: int = 0, limit: int = 100, db: Session = Depends(get_db)):
    return student_crud.get_students(db, skip, limit)

@app.get("/students/{student_id}", response_model=student_schema.Student)
def read_student(student_id: int, db: Session = Depends(get_db)):
    db_student = student_crud.get_student(db, student_id)
    if db_student is None:
        raise HTTPException(status_code=404, detail="Student not found")
    return db_student

@app.put("/students/{student_id}", response_model=student_schema.Student)
def update_student(student_id: int, student: student_schema.StudentUpdate, db: Session = Depends(get_db)):
    db_student = student_crud.update_student(db, student_id, student)
    if db_student is None:
        raise HTTPException(status_code=404, detail="Student not found")
    return db_student

@app.delete("/students/{student_id}", response_model=student_schema.Student)
def delete_student(student_id: int, db: Session = Depends(get_db)):
    db_student = student_crud.delete_student(db, student_id)
    if db_student is None:
        raise HTTPException(status_code=404, detail="Student not found")
    return db_student


app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Или ["http://localhost:5173"]
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(admins.router, prefix="/admins", tags=["Admins"])