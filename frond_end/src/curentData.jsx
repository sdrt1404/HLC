import React from "react";

export default function CurrentDate() {
  const today = new Date();
  const options = { year: "numeric", month: "long", day: "numeric" };
 const formattedDate = today.toLocaleDateString("ru-RU", options);

  return (
    <div className="flex text-[30px]">
      <h1 className="font-black">дата: </h1>
      <p className="font-bold">{formattedDate}</p>
    </div>
  );
}
