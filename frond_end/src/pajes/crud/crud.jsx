


import axios from "axios";
import { useEffect, useState } from "react";
import { Button, Modal } from 'antd';
import TextField from '@mui/material/TextField';
import { Link } from "react-router-dom";

export default function Crud() {



    let [search, setSearch] = useState("")

    const [selectedNumber, setSelectedNumber] = useState("");
    const [selectedUser, setSelectedUser] = useState("");
    const [selectedGroup, setSelectedGroup] = useState("");
    const [selectedStatus, setSelectedStatus] = useState("");
    const [selectedDate, setSelectedDate] = useState("");
    const [selectedAmount, setSelectedAmount] = useState("");



    const today = new Date();
    const options = { year: "numeric", month: "long", day: "numeric" };
    const formattedDate = today.toLocaleDateString("ru-RU", options);



    let API = "https://685a9abb9f6ef96111571888.mockapi.io/Frontent"

    let [data, setData] = useState([])
    async function get() {
        try {
            let { data } = await axios.get(API)
            setData(data)
        } catch (error) {
            console.log(error);
        }
    }


    useEffect(() => {
        get()
    }, [])



    async function deleteUser(id) {
        try {
            await axios.delete(`${API}/${id}`)
            get()
        } catch (error) {
            console.log(error);
        }
    }


    

    const filteredData = data
        .filter(e => e.name.toLowerCase().includes(search.toLowerCase()))
        .filter(e => !selectedUser || e.name === selectedUser)
        .filter(e => !selectedGroup || e.group === selectedGroup)
        .filter(e => !selectedStatus || String(e.status) === selectedStatus)
        .filter(e => !selectedDate || e.date === selectedDate)
        .filter(e => !selectedAmount || String(e.sumOplat) === selectedAmount);


    return (<>
        <div className="flex w-[90%] m-auto justify-between">
            <TextField id="outlined-basic" label="Search" variant="outlined" value={search} onChange={(e) => setSearch(e.target.value)} />
                <Link to={'/addPage'}>
            <button  className="bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 px-7 rounded-lg shadow-md transition duration-400 ease-in-out"> Add User</button>
                </Link>

        </div>
      

        <table className=" bg-white w-[96%] mt-[100px] m-auto shadow-md rounded-xl overflow-hidden">


         

            <thead className="bg-gray-100 text-gray-700">
                <tr>
                    <th className="px-4 py-3">
                    <h1>№</h1>
                    </th>

                    <th className="px-4 py-3 text-center">
                  <h1>User</h1>
                    </th>

                    <th className="px-4 py-3">
                        <select
                            className="w-full bg-white border border-gray-300 rounded-lg px-3 py-2 text-sm shadow-sm focus:outline-none focus:ring-2 focus:ring-green-400 focus:border-green-400 transition duration-200 hover:border-gray-400"
                            value={selectedGroup}
                            onChange={(e) => setSelectedGroup(e.target.value)}
                        >
                            <option value="">Group</option>
                            {Array.from(new Set(filteredData.map(u => u.group))).map(group => (
                                <option key={group} value={group}>{group}</option>
                            ))}
                        </select>
                    </th>

                    <th className="px-4 py-3">
                        <select
                            className="w-full bg-white border border-gray-300 rounded-lg px-3 py-2 text-sm shadow-sm focus:outline-none focus:ring-2 focus:ring-yellow-400 focus:border-yellow-400 transition duration-200 hover:border-gray-400"
                            value={selectedStatus}
                            onChange={(e) => setSelectedStatus(e.target.value)}
                        >
                            <option value="">Status</option>
                            <option value="true">Active</option>
                            <option value="false">Inactive</option>
                        </select>
                    </th>

                    <th className="px-4 py-3">
                    <h1>Date of Payment</h1>
                    </th>

                    <th className="px-4 py-3">
                      <h1>Amount</h1>
                    </th>

                    <th className="px-4 py-3">Actions</th>
                </tr>
            </thead>



            <tbody className="divide-y divide-gray-200">
                {filteredData.map((e, i) => (
                    <tr key={e.id} className="hover:bg-gray-50 transition">
                        <td className="px-4 py-3">{i + 1}</td>
                        <td className="px-4 py-3">
                            <div className="flex items-center gap-3">
                                <img
                                    className="w-[40px] h-[40px] rounded-full object-cover"
                                    src={e.avatar}
                                    alt={e.name}
                                />
                                <div>
                                    <h1 className="font-medium">{e.name}</h1>
                                    <p className="text-sm text-gray-500  max-w-[300px] line-clamp-3  truncate" >{e.des}</p>
                                </div>
                            </div>
                        </td>
                        <td>{e.group}</td>
                        <td className="px-4 py-3 ">{e.status == true ? "Active" : "Inactive"}</td>
                        <td className="px-4 py-3">{formattedDate}</td>
                        <td className="px-4 py-3 font-semibold text-green-600">{e.sumOplat}$</td>
                        <td className="px-4 py-3">
                            <div className="flex gap-2">
                                <button onClick={() => deleteUser(e.id)} className="bg-red-100 text-red-500 px-2 py-1 rounded hover:bg-red-200" title="Delete">🗑️</button>
                                <Link to={`/edit/${e.id}`}>
                                    <button className="bg-blue-100 text-blue-500 px-2 py-1 rounded hover:bg-blue-200" title="Edit">🖊️</button>
                                </Link>
                            </div>
                        </td>
                    </tr>
                ))}
            </tbody>
        </table>

    </>)
}