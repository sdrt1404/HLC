from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from app.crud import admins as crud
from app.models import admins as models
from app.database import get_db
from app.schemas import admins as schemas

router = APIRouter(prefix="/admins", tags=["Admins"])

# Заглушка для получения текущего пользователя (заменим на авторизацию)
def get_current_user():
    return models.Admin(id=1, full_name="Director", username="director", role=models.AdminRole.director, branch_id=1, password_hash="")

@router.post("/", response_model=schemas.AdminOut)
def create_admin(admin: schemas.AdminCreate, db: Session = Depends(get_db), current_user: models.Admin = Depends(get_current_user)):
    try:
        return crud.create_admin(db, admin, current_user)
    except PermissionError as e:
        raise HTTPException(status_code=403, detail=str(e))

@router.get("/", response_model=list[schemas.AdminOut])
def read_admins(db: Session = Depends(get_db)):
    return crud.get_admins(db)

@router.put("/{admin_id}", response_model=schemas.AdminOut)
def update_admin(admin_id: int, admin: schemas.AdminUpdate, db: Session = Depends(get_db), current_user: models.Admin = Depends(get_current_user)):
    try:
        updated_admin = crud.admin.update_admin(db, admin_id, admin, current_user)
        if not updated_admin:
            raise HTTPException(status_code=404, detail="Admin not found")
        return updated_admin
    except PermissionError as e:
        raise HTTPException(status_code=403, detail=str(e))

@router.delete("/{admin_id}")
def delete_admin(admin_id: int, db: Session = Depends(get_db), current_user: models.Admin = Depends(get_current_user)):
    try:
        if crud.admin.delete_admin(db, admin_id, current_user):
            return {"message": "Admin deleted"}
        else:
            raise HTTPException(status_code=404, detail="Admin not found")
    except PermissionError as e:
        raise HTTPException(status_code=403, detail=str(e))
