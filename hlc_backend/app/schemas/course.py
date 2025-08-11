from pydantic import BaseModel
from typing import Optional
from pydantic import BaseModel

class CourseInDB(BaseModel):
    id: int
    name: str
    price: float
    

    class Config:
        orm_mode = True


class CourseBase(BaseModel):
    name: str
    price: float
    

class CourseCreate(CourseBase):
    pass

class CourseRead(CourseBase):
    id: int

    class Config:
        orm_mode = True
