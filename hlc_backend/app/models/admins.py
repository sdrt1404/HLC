from sqlalchemy import Column, Integer, String, ForeignKey, Enum, Boolean
from sqlalchemy.orm import relationship
from app.database import Base
import enum

class Branch(Base):
    __tablename__ = "branches"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, unique=True, nullable=False)
    address = Column(String, nullable=True)
    is_active = Column(Boolean, default=True)
class AdminRole(str, enum.Enum):
    director = "director"
    admin = "admin"
    super_admin = "super_admin"

class Admin(Base):
    __tablename__ = "admins"

    id = Column(Integer, primary_key=True, index=True)
    full_name = Column(String, nullable=False)
    username = Column(String, unique=True, index=True, nullable=False)
    password_hash = Column(String, nullable=False)
    role = Column(Enum(AdminRole), nullable=False, default=AdminRole.admin)
    branch_id = Column(Integer, ForeignKey("branches.id"), nullable=False)

    
