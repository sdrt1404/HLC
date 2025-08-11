from sqlalchemy.orm import Session
from app.models import admins as models
from app.schemas import admins as schemas
from passlib.context import CryptContext
pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")

def get_password_hash(password):
    return pwd_context.hash(password)

def create_admin(db: Session, admin: schemas.AdminCreate, current_user: models.Admin):
    if current_user.role != models.AdminRole.director:
        raise PermissionError("Only directors can create admins")
    db_admin = models.Admin(
        full_name=admin.full_name,
        username=admin.username,
        role=admin.role,
        branch_id=admin.branch_id,
        password_hash=get_password_hash(admin.password)
    )
    db.add(db_admin)
    db.commit()
    db.refresh(db_admin)
    return db_admin

def get_admins(db: Session):
    return db.query(models.Admin).all()

def update_admin(db: Session, admin_id: int, admin: schemas.AdminUpdate, current_user: models.Admin):
    if current_user.role != models.AdminRole.director:
        raise PermissionError("Only directors can update admins")
    db_admin = db.query(models.Admin).filter(models.Admin.id == admin_id).first()
    if not db_admin:
        return None
    for field, value in admin.dict(exclude_unset=True).items():
        if field == "password":
            setattr(db_admin, "password_hash", get_password_hash(value))
        else:
            setattr(db_admin, field, value)
    db.commit()
    db.refresh(db_admin)
    return db_admin

def delete_admin(db: Session, admin_id: int, current_user: models.Admin):
    if current_user.role != models.AdminRole.director:
        raise PermissionError("Only directors can delete admins")
    db_admin = db.query(models.Admin).filter(models.Admin.id == admin_id).first()
    if db_admin:
        db.delete(db_admin)
        db.commit()
        return True
    return False