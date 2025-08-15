import { Route, Routes } from "react-router-dom";
import Layout from "./pajes/layout/layout";
import Login from "./pajes/login/login";
import Home from "./pajes/home/home";
import Debtor from "./pajes/debtor/debtor";
import ProtectedLayout from "./pajes/layout/protectedLyout";
import Crud from "./pajes/crud/crud";
import EditPage from "./pajes/editPage/editpage";




export default function App() {
  



  return(<>
  
  
  <Routes>
    <Route path="/" element={<Layout/>}>
      <Route index  element={<Home/>}/>
      <Route path="login" element={<Login/>}/>
      <Route path="debtor" element={<Debtor/>}/>
      <Route path="crud" element={<Crud/>}/>
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