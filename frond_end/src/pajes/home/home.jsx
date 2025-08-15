import CurrentDate from "@/curentData";
import { useScrollTrigger } from "@mui/material";
import axios from "axios";
import { useEffect, useState } from "react";





export default function Home() {

    //Да оянда мезанем и пейча 


    // let API = "https://685a9abb9f6ef96111571888.mockapi.io/Frontent"
    // let [data, setData] = useState([])

    // async function get() {
    //     try {
    //         let { data } = await axios.get(API)
    //         setData(data)

    //     } catch (error) {
    //         console.log(error);
    //     }
    // }


    // useEffect(() => {
    //     get()
    // }, [])




    return (<>

        <section className="w-[90%] m-auto ">

        


            <section class="page_404">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 ">
                            <div class="col-sm-10 col-sm-offset-1  text-center">
                                <div class="four_zero_four_bg">
                                    <h1 class="text-center ">404</h1>


                                </div>

                                <div class="contant_box_404">
                                    <h3 class="h2">
                                        Look like you're lost
                                    </h3>

                                    <p>the page you are looking for not avaible!</p>

                      
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </section>

    </>)
}