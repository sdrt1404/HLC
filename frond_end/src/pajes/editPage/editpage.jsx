
import TextField from "@mui/material/TextField";


import { useEffect, useState } from "react";
import { Link, useParams } from "react-router-dom";
import axios from "axios"; // ← ЭТОТ ИМПОРТ ОБЯЗАТЕЛЕН

export default function EditPage() {
    let API = "https://685a9abb9f6ef96111571888.mockapi.io/Frontent";
    let { id } = useParams();

    // let [product, setProduct] = useState(null);
    const [product, setProduct] = useState({
        name: "",
        avatar: "",
        group: "",
        age: "",
        des: "",
        sumOplat: "",
    });


    async function getEditInfo() {
        try {
            const { data } = await axios.get(`${API}/${id}`);
            setProduct(data);
        } catch (error) {
            console.log("Ошибка при получении данных:", error);
        }
    }

    useEffect(() => {
        getEditInfo();
    }, [id]);

    if (!product) return <h1>Загрузка...</h1>;



    async function handleEditSubmit() {
    try {
        const confirm = window.confirm("Вы действительно хотите изменить пользователя?");
        if (!confirm) return;

        await axios.put(`${API}/${id}`, product); // отправка обновлённых данных
        alert("Пользователь успешно обновлён!");
        getEditInfo()
    } catch (error) {
        console.error("Ошибка при обновлении:", error);
        alert("Произошла ошибка при сохранении");
    }
}


    return (
        <div className="max-w-[500px] mx-auto mt-10 bg-white shadow-lg flex flex-col gap-[20px] rounded-2xl p-6 text-center space-y-6 border border-gray-200">
            <h1 className="text-3xl font-bold text-gray-800">Редактировать профиль</h1>

            <div className="flex justify-center">
                <img
                    src={product.avatar}
                    alt={product.name}
                    className="w-[150px] h-[150px] rounded-full object-cover border-4 border-red-300"
                />
            </div>

            <div className="space-y-4 flex flex-col gap-[20px]">
                <TextField
                    label="Имя"
                    variant="outlined"
                    fullWidth
                    value={product.name}
                    onChange={(e) => setProduct({ ...product, name: e.target.value })}
                />
                <TextField
                    label="Группа"
                    variant="outlined"
                    fullWidth
                    value={product.group}
                    onChange={(e) => setProduct({ ...product, group: e.target.value })}
                />
                <TextField
                    label="Возраст"
                    variant="outlined"
                    fullWidth
                    value={product.age}
                    onChange={(e) => setProduct({ ...product, age: e.target.value })}
                />
                <TextField
                    label="Описание"
                    variant="outlined"
                    fullWidth
                    multiline
                    rows={3}
                    value={product.des}
                    onChange={(e) => setProduct({ ...product, des: e.target.value })}
                />
                <TextField
                    label="Сумма оплаты ($)"
                    variant="outlined"
                    fullWidth
                    value={product.sumOplat}
                    onChange={(e) => setProduct({ ...product, sumOplat: e.target.value })}
                />
                <select name="" value={product.status}  onChange={(e)=>setProduct({...product,status:e.target.value})} id="">
                    <option value="true">Active</option>
                    <option value="false">Inactive</option>
                </select>
            </div>
            <div className="flex  gap-[20px]">

            <Link to={'/crud'}>
            <button className="w-[200px] h-[40px] bg-red-600 text-white rounded-[10px]">Cancel</button>
            </Link>
            <Link to={'/crud'}>
            
            <button className="w-[200px] h-[40px] rounded-[10px] bg-blue-500 text-white "  onClick={handleEditSubmit}>Edit</button>
            </Link>
            </div>
        </div>
    );

}
