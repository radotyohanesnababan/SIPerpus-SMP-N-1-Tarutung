import React, { useRef } from "react";
import html2canvas from "html2canvas";

export default function LibraryCard({ user }) {

    const cardRef = useRef();

    const downloadCard = async () => {
        const canvas = await html2canvas(cardRef.current, { scale: 2 });
        const image = canvas.toDataURL("image/png");
        const link = document.createElement("a");
        link.href = image;
        link.download = `Kartu_${user.name.replace(/\s+/g, "_")}.png`;
        link.click();
    };

    return (
        <div className="p-6 flex flex-col items-center">

            <h1 className="text-2xl font-bold mb-4">Kartu Perpustakaan</h1>

            <div 
                ref={cardRef}
                className="w-[320px] h-[200px] bg-white rounded-xl shadow-xl border p-4 relative flex"
                style={{ backgroundImage: "url('/img/kartu-bg.png')", backgroundSize: "cover" }}
            >
                <div className="w-24 h-28 bg-gray-200 rounded-md overflow-hidden border">
                </div>
                <div className="ml-4 flex flex-col justify-center">
                    <h2 className="font-bold text-lg">{user.nama}</h2>
                    <p className="text-sm">NISN: {user.nisn ?? "-"}</p>
                    <p className="text-sm">Kelas: {user.kelas_id ?? "-"}</p>
                    <p className="text-xs mt-2 text-gray-500">Perpustakaan SMP N 1 Tarutung</p>
                </div>
                <div className="absolute top-2 right-3 text-sm font-semibold text-gray-600">
                    {new Date().getFullYear()}
                </div>
                <img 
                    src="/storage/logo/logosekolah.png"
                    className="absolute top-2 left-3 w-10"
                    alt="logo"
                />
            </div>
            <button 
                onClick={downloadCard}
                className="mt-4 px-4 py-2 bg-blue-600 text-white rounded shadow"
            >
                Unduh sebagai Gambar
            </button>
        </div>
    );
}
