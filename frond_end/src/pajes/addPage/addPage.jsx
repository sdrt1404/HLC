import { useState } from "react";
import axios from "axios";
import { TextField } from "@mui/material";
import { useNavigate } from "react-router-dom";

export default function AddPage() {
  let [inpAddName, setInpAddName] = useState("");
  let [inpAddAge, setInpAddAge] = useState("");
  let [inpAddAvatar, setInpAddAvatar] = useState(null);
  let [inpAddAvatarFile, setInpAddAvatarFile] = useState(null); // для имени файла
  let [inpAddDes, setInpAddDes] = useState("");
  let [inpAddGroup, setInpAddGroup] = useState("");
  let [inpAddSum, setInpAddSum] = useState("");

  let API = "https://685a9abb9f6ef96111571888.mockapi.io/Frontent";
  const navigate = useNavigate();

  const handleFileChange = (e) => {
    const file = e.target.files[0];
    if (file) {
      setInpAddAvatarFile(file.name); 
      const reader = new FileReader();
      reader.onloadend = () => {
        setInpAddAvatar(reader.result); 
      };
      reader.readAsDataURL(file);
    }
  };

  async function addNewUser() {
    let newUser = {
      name: inpAddName,
      avatar: inpAddAvatar,
      des: inpAddDes,
      group: inpAddGroup,
      age: inpAddAge,
      sumOplat: inpAddSum,
      id: Date.now(),
    };
    try {
      await axios.post(API, newUser);
      navigate("/");
    } catch (error) {
      console.log(error);
    }
  }

  return (
    <div className="flex flex-col gap-6 lg:w-[50%] m-auto mt-[50px] bg-white p-6 rounded-2xl shadow-lg">
      <h1 className="text-2xl font-semibold text-center text-gray-800">➕ Add New User</h1>

      <TextField label="Full Name" variant="outlined" value={inpAddName} onChange={(e) => setInpAddName(e.target.value)} />

      {/* Кастомный file input */}
      <div className="flex lg:flex-col flex-row items-center gap-3">
        {inpAddAvatar ? (
          <img
            src={inpAddAvatar}
            alt="Preview"
            className="w-[120px] h-[120px] object-cover rounded-full shadow-md border-2 border-gray-200"
          />
        ) : (
          <div className="w-[120px] h-[120px] rounded-full bg-gray-100 flex items-center justify-center text-gray-400 text-sm shadow-inner">
            No Photo
          </div>
        )}

        <label className="cursor-pointer bg-blue-600 hover:bg-blue-700 text-white py-2 px-4 rounded-lg shadow transition duration-300">
          Choose Photo
          <input type="file" accept="image/*" onChange={handleFileChange} className="hidden" />
        </label>

        {inpAddAvatarFile && (
          <p className="text-sm text-gray-500">📷 {inpAddAvatarFile}</p>
        )}
      </div>

      <TextField label="Description" variant="outlined" value={inpAddDes} onChange={(e) => setInpAddDes(e.target.value)} />
      <TextField label="Amount" variant="outlined" value={inpAddSum} onChange={(e) => setInpAddSum(e.target.value)} />
      <TextField label="Age" variant="outlined" value={inpAddAge} onChange={(e) => setInpAddAge(e.target.value)} />
      <TextField label="Group" variant="outlined" value={inpAddGroup} onChange={(e) => setInpAddGroup(e.target.value)} />

      <button
        onClick={addNewUser}
        className="bg-green-600 hover:bg-green-700 text-white font-semibold py-2 px-6 rounded-lg shadow-md transition duration-300"
      >
        Save
      </button>
    </div>
  );
}
