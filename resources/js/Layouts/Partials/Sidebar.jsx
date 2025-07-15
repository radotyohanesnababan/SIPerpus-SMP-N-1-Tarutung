import NavLink from '@/Components/NavLink';
import { IconChartDots2, IconDashboard } from '@tabler/icons-react';

export default function Sidebar({ url, auth }) {
    return (
        <nav className="grid  items-start px-2 text-sm font-semibold lg:px-4">
            <div className="px-3 py-2 text-sm font-semibold text-foreground">Dashboard</div>
            <NavLink
                url={route('dashboard')}
                active={url.startsWith('/dashboard')}
                title="Dashboard"
                icon={IconDashboard}
            />

            <div className="px-3 py-2 text-sm font-semibold text-foreground">Peminjaman</div>
            <NavLink url="#" title="Riwayat Peminjaman" icon={IconChartDots2} />
            <NavLink url="#" title="Validasi Peminjaman" icon={IconChartDots2} />

            <div className="px-3 py-2 text-sm font-semibold text-foreground">Pengembalian</div>
            <NavLink url="#" title="Riwayat Pengembalian" icon={IconChartDots2} />
            <NavLink url="#" title="Validasi Pengembalian" icon={IconChartDots2} />

            <div className="px-3 py-2 text-sm font-semibold text-foreground">Master</div>
            <NavLink url="#" title="Buku" icon={IconChartDots2} />
            <NavLink
                url={route('admin.publishers.index')}
                active={url.startsWith('/admin/publishers')}
                title="Penerbit"
                icon={IconChartDots2}
            />
            <NavLink
                url={route('admin.categories.index')}
                active={url.startsWith('/admin/categories')}
                title="Kategori"
                icon={IconChartDots2}
            />
            <NavLink url="#" title="Stok Buku" icon={IconChartDots2} />
            <NavLink url="#" title="E-book" icon={IconChartDots2} />
            <NavLink url="#" title="Anggota" icon={IconChartDots2} />

            <div className="px-3 py-2 text-sm font-semibold text-foreground">Lainnya</div>
            <NavLink url="#" title="Pengumuman" icon={IconChartDots2} />
            <NavLink url={route('profile.edit')} title="Profil" icon={IconChartDots2} />
        </nav>
    );
}
