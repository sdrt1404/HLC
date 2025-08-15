import logoHs from '@/assets/PNG.png'
import { Link, Outlet } from 'react-router-dom'
import Button from '@mui/material/Button';
import { useState } from 'react';




export default function ProtectedLayout() {
    const [isOpen, setIsOpen] = useState(false);




    return (<>


        <header className='flex w-[90%] m-auto justify-between items-center     '>
            <div className='flex items-center w-[200px]'>
                <img className='w-[200px]' src={logoHs} alt="" />
                <div>
                    <h1 className='font-semibold text-[20px]'>Cambridge</h1>
                    <h2>School</h2>
                </div>
            </div>
        {/* Ду варианти header аст выд=бор за вами */}


            {/* 
            <div className='flex gap-[30px]'>


                <Link to={'/'}>
                    <h1 className='font-bold text-[30px]'>Home</h1>
                </Link>

                <Link to={'/debtor'}>
                    <h1 className='font-bold text-[30px]'>Debtor</h1>
                </Link>
            </div>
            <Link to={'/login'}>
                <Button variant="outlined" size="medium">   Login </Button>
            </Link> 
            */}

           

        </header>


        <main className='mt-[50px]'><Outlet /></main>
    </>)
}