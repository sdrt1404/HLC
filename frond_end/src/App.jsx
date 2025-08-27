import { Route, Routes } from "react-router-dom";
import Layout from "./pajes/layout/layout";
import Login from "./pajes/login/login";
import Home from "./pajes/home/home";
import Debtor from "./pajes/debtor/debtor";
import ProtectedLayout from "./pajes/layout/protectedLyout";
import Crud from "./pajes/crud/crud";
import EditPage from "./pajes/editPage/editpage";
import AddPage from "./pajes/addPage/addPage";




export default function App() {




  return (<>


    <Routes>
      <Route path="/" element={<Layout />}>
        <Route path="home" element={<Home />} />
        <Route index element={<Login />} />
        <Route path="debtor" element={<Debtor />} />
        <Route path="crud" element={<Crud />} />
        <Route path="addPage" element={<AddPage />} />
        {/* <Route path="edit/:id" element={<EditPage/>}/> */}

        <Route path="/edit/:id" element={<EditPage />} />
      </Route>
    </Routes>

    {/* 
  <Routes>
    <Route path="/" element={<ProtectedLayout/>}>
      <Route index element={<Login/>}/>
    </Route>
  </Routes> */}
  </>)
}