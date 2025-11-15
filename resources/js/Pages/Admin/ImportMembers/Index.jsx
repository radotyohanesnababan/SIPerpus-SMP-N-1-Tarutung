import HeaderTitle from '@/Components/HeaderTitle';
import { Button } from '@/Components/ui/button';
import { Input } from '@/Components/ui/input';
import AppLayout from '@/Layouts/AppLayout';
import { Head, router } from '@inertiajs/react';
import { IconFileExcel } from '@tabler/icons-react';
import { useEffect, useState } from 'react';
import { toast } from 'sonner';

export default function Index({ kelas, status, ...props }) {
    const { page_settings } = props;
    const [file, setFile] = useState(null);
    const [loading, setLoading] = useState(false);

    useEffect(() => {
        if (props.flash_message?.message) {
            toast[props.flash_message.type || 'success'](props.flash_message.message);
        }
    }, [props.flash_message]);

    const handleFileChange = (e) => {
        setFile(e.target.files[0]);
    };

    const handleImport = () => {
        if (!file) {
            toast.error('Pilih file Excel terlebih dahulu!');
            return;
        }
        setLoading(true);
        const formData = new FormData();
        formData.append('file', file);

        router.post(route('admin.import-members'), formData, {
            onError: (errors) => {
                toast.error('Gagal mengimport data.');
                console.error(errors);
            },
            onFinish: () => setLoading(false),
        });
    };

    return (
        <>
            <Head title={page_settings.title} />
            <HeaderTitle
                title={page_settings.title}
                subtitle={page_settings.subtitle}
                icon={IconFileExcel}
            />

            <div className="max-w-xl mx-auto py-10">
                <div className="space-y-6 bg-white dark:bg-gray-800 rounded-lg p-6 shadow">
                    <h2 className="text-2xl font-semibold text-center mb-4">
                        Masukkan File Import
                    </h2>
                    <h3 className="text-left text-sm text-gray-500">
                        Format file yang diterima: <b>.xlsx</b>.  
                    </h3>
                    <Button className="w-full bg-yellow-400 hover:bg-yellow-500 text-gray-800 font-semibold">
                        <a
                            href='/storage/template_import/TemplateAnggotaImport.xlsx'
                            target="_blank"
                            rel="noopener noreferrer"
                        >
                            Download Template Excel Anggota
                        </a>
                    </Button>

                    <Input type="file" accept=".xlsx,.xls,.csv" onChange={handleFileChange} />

                    <Button
                        disabled={loading}
                        onClick={handleImport}
                        className="w-full bg-sky-600 hover:bg-sky-700 text-white font-semibold"
                    >
                        <IconFileExcel className="mr-2 h-5 w-5" />
                        {loading ? 'Mengupload...' : 'Submit Import'}
                    </Button>
                </div>
            </div>
        </>
    );
}

Index.layout = (page) => (
    <AppLayout
        title={page.props.page_settings.title}
        subtitle={page.props.page_settings.subtitle}
    >
        {page}
    </AppLayout>
);
