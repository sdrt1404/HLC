from pydantic import BaseModel
from typing import Optional
from enum import Enum

class AdminRole(str, Enum):
    director = "director"
    admin = "admin"
    super_admin = "super_admin"

class AdminBase(BaseModel):
    full_name: str
    username: str
    role: AdminRole
    branch_id: int

class AdminCreate(AdminBase):
    password: str

class AdminUpdate(BaseModel):
    full_name: Optional[str] = None
    username: Optional[str] = None
    role: Optional[AdminRole] = None
    branch_id: Optional[int] = None
    password: Optional[str] = None

class AdminOut(AdminBase):
    id: int

    class Config:
        orm_mode = True
