import logoHs from '@/assets/PNG.png'
import { Link, Outlet } from 'react-router-dom'
import Button from '@mui/material/Button';
import { useState } from 'react';




export default function Layout() {
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

            <div className="relative ">
                <button
                    onClick={() => setIsOpen(!isOpen)}
                    className="px-4 py-2 bg-blue-600 text-white rounded"
                >
                    Открыть панель
                </button>

                {/* Затемнённый фон */}
                <div
                    className={`fixed inset-0 bg-black/50 transition-opacity duration-300 ${isOpen ? 'opacity-100 pointer-events-auto' : 'opacity-0 pointer-events-none'
                        }`}
                    onClick={() => setIsOpen(false)}
                ></div>

                {/* Выезжающая панель */}
                <div
                    className={`fixed top-0 right-0 h-full w-64 bg-white shadow-lg transform transition-transform duration-300 ${isOpen ? 'translate-x-0' : 'translate-x-full'
                        }`}
                >
                    <div className="p-4 flex flex-col justify-around  gap-[100px]">
                        <div>
                            <h2 className="text-lg font-bold">Панель</h2>



                            <Link to={'/'}>
                                <h1 className='font-bold text-[30px]' onClick={()=>setIsOpen(false)}>Home</h1>
                            </Link>

                            <Link to={'/debtor'}>
                                <h1 className='font-bold text-[30px]' onClick={()=>setIsOpen(false)}>Debtor</h1>
                            </Link>
                            <Link to={'/crud'}>
                            <h1>Crud</h1>
                            </Link>
                        </div>


                        <div className='flex flex-col'>

                            <Link to={'/login'}>
                                <Button variant="outlined" size="medium" onClick={()=>setIsOpen(false)}>   Login </Button>
                            </Link>

                            <button onClick={() => setIsOpen(false)}  className="mt-4 lg:top-[700px] w-[200px] top-[600px] absolute px-4 py-2 bg-red-500 text-white rounded" >Закрыть  </button>
                        </div>
                    </div>
                </div>
            </div>


        </header>


        <main className='mt-[50px]'><Outlet /></main>
    </>)
}