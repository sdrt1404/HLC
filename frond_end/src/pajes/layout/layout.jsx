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

     <div className="relative">
  {/* Кнопка открытия */}
  <button
    onClick={() => setIsOpen(!isOpen)}
    className="px-6 py-2 bg-gradient-to-r from-blue-500 to-blue-700 hover:from-blue-600 hover:to-blue-800 text-white font-semibold rounded-xl shadow-lg transition-all duration-300"
  >
    Открыть панель
  </button>

  {/* Затемнённый фон */}
  <div
    className={`fixed inset-0 bg-black/40 transition-opacity duration-300 backdrop-blur-md ${
      isOpen ? 'opacity-100 pointer-events-auto' : 'opacity-0 pointer-events-none'
    }`}
    onClick={() => setIsOpen(false)}
  ></div>

  {/* Выезжающая панель */}
  <div
    className={`fixed top-0 right-0 h-full w-80 bg-white shadow-2xl transform transition-all duration-300 ease-in-out rounded-l-3xl ${
      isOpen ? 'translate-x-0 opacity-100' : 'translate-x-full opacity-0'
    }`}
  >
    {/* Шапка панели */}
    <div className="bg-gradient-to-r from-blue-500 to-blue-700 text-white p-6 rounded-tl-3xl">
      <h2 className="text-2xl font-bold">📂 Меню</h2>
      <p className="text-sm opacity-80">Навигация по сайту</p>
    </div>

    {/* Контент */}
    <div className="flex flex-col justify-between h-[calc(100%-88px)] p-6">
      {/* Верхняя часть */}
      <div className="space-y-4">
        {[
          { path: '/', label: '🏠 Home' },
          { path: '/debtor', label: '💰 Debtor' },
          { path: '/crud', label: '🛠 Crud' }
        ].map((item, idx) => (
          <Link
            key={idx}
            to={item.path}
            onClick={() => setIsOpen(false)}
            className="block text-lg font-medium px-4 py-2 rounded-lg hover:bg-blue-50 hover:text-blue-600 transition-all"
          >
            {item.label}
          </Link>
        ))}
      </div>

      {/* Нижняя часть */}
      <div className="space-y-4">
        <Link to="/login" onClick={() => setIsOpen(false)}>
          <Button
            variant="outlined"
            size="medium"
            className="w-full rounded-lg"
          >
            Login
          </Button>
        </Link>

        <button
          onClick={() => setIsOpen(false)}
          className="w-full px-4 py-2 bg-red-500 hover:bg-red-600 text-white font-semibold rounded-lg shadow-md transition-all"
        >
          Закрыть
        </button>
      </div>
    </div>
  </div>
    </div>
 
            


        </header>


        <main className='mt-[50px]'><Outlet /></main>
    </>)
}