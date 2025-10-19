import { useForm, Head } from "@inertiajs/react";
import { useEffect, useState } from "react";
import { Button } from "@/Components/ui/button";
import { DatePickerWithRange } from "@/Components/DatePickerWithRange";
import { Card, CardContent, CardFooter } from "@/Components/ui/card";
import { Label } from "@/Components/ui/label";
import AppLayout from "@/Layouts/AppLayout";
import HeaderTitle from "@/Components/HeaderTitle";
import { IconPrinter, IconSchool } from "@tabler/icons-react";
import { toast } from 'sonner';

import { Input } from "@/Components/ui/input";

export default function Index({ kelas, status, ...props }) {
    
    const { meta, page_settings } = props;
    useEffect(() => {
            if (props.flash_message?.message) {
                toast[props.flash_message.type || 'success'](props.flash_message.message);
            }
        }, [props.flash_message]);


  const [periode, setPeriode] = useState({ from: null, to: null });

  const handleCetak = () => {
    if (!periode.from || !periode.to) {
      alert("Silakan pilih tanggal awal dan akhir.");
      return;
    }
    const url = route("admin.reports.generate", {
      start: periode.from.toISOString().split("T")[0],
      end: periode.to.toISOString().split("T")[0],
    });
    window.open(url, "_blank");
  };


    return (
       <>
            <Head title={page_settings.title} />
            <HeaderTitle
                title={page_settings.title}
                subtitle={page_settings.subtitle}
                icon={IconPrinter}
            />

           <div className="max-w-xl mx-auto py-10">
        <div className="space-y-6 bg-white dark:bg-gray-800 rounded-lg p-6 shadow">
          <h2 className="text-2xl font-semibold text-center mb-4">
            Pilih Periode Laporan
          </h2>

          <DatePickerWithRange
            value={periode}
            onChange={(range) => setPeriode(range)}
          />

          <Button
            onClick={handleCetak}
            className="w-full bg-sky-600 hover:bg-sky-700 text-white font-semibold"
          >
            <IconPrinter className="mr-2 h-5 w-5" />
            Cetak Laporan
          </Button>
        </div>
      </div>
        </>
    );
}

Index.layout = (page) => (
    <AppLayout title={page.props.page_settings.title} subtitle={page.props.page_settings.subtitle}>
        {page}
    </AppLayout>
);

