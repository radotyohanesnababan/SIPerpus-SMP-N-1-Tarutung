import NavLink from '@/Components/NavLink';
import {
    IconAlertCircle,
    IconChartDots2,
    IconCreditCardPay,
    IconCreditCardRefund,
    IconDashboard,
    IconUsersGroup,
    IconUser
} from '@tabler/icons-react';

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
            <NavLink
                url={route('admin.borroweds.index')}
                active={url.startsWith('/admin/borroweds')}
                title="Riwayat Peminjaman"
                icon={IconCreditCardPay}
            />
            <NavLink url="#" title="Validasi Peminjaman" icon={IconChartDots2} />

            <div className="px-3 py-2 text-sm font-semibold text-foreground">Pengembalian</div>
            <NavLink
                url={route('admin.return-books.index')}
                active={url.startsWith('/admin/return-books')}
                title="Riwayat Pengembalian"
                icon={IconCreditCardRefund}
            />
            <NavLink url="#" title="Validasi Pengembalian" icon={IconChartDots2} />

            <div className="px-3 py-2 text-sm font-semibold text-foreground">Master</div>
            <NavLink
                url={route('admin.books.index')}
                active={url.startsWith('/admin/books')}
                title="Buku"
                icon={IconChartDots2}
            />
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
            <NavLink
                url={route('admin.users.index')}
                title="Anggota"
                icon={IconUsersGroup}
                active={url.startsWith('/admin/users')}
            />

            <div className="px-3 py-2 text-sm font-semibold text-foreground">Peran dan  Izin</div>
            <NavLink
                url={route('admin.roles.index')}
                title="Peran"
                icon={IconAlertCircle}
                active={url.startsWith('/admin/roles')}
            />
            <NavLink
                url={route('admin.permissions.index')}
                title="Izin"
                icon={IconUser}
                active={url.startsWith('/admin/permissions')}
            />
            <NavLink
                url={route('admin.assign-permissions.index')}
                title=" Tetapkan Izin"
                icon={IconUser}
                active={url.startsWith('/admin/permissions')}
            />

            <div className="px-3 py-2 text-sm font-semibold text-foreground">Lainnya</div>
            <NavLink
                url={route('admin.announcements.index')}
                title="Pengumuman"
                icon={IconAlertCircle}
                active={url.startsWith('/admin/announcements')}
            />
            <NavLink
                url={route('profile.edit')}
                title=" Edit Profil"
                icon={IconUser}
                active={url.startsWith('/admin/profile')}
            />
        </nav>
    );
}
