import NavLink from '@/Components/NavLink';
import {
    IconAlertCircle,
    IconCategory,
    IconChartArea,
    IconChartDots2,
    IconCreditCardPay,
    IconCreditCardRefund,
    IconDashboard,
    IconNotebook,
    IconStack,
    IconUser,
    IconUsersGroup,
} from '@tabler/icons-react';

export default function Sidebar({ url, auth }) {
    return (
        <>
            {auth.role.some((role) => ['admin'].includes(role)) && (
                <nav className="grid  items-start px-2 text-sm font-semibold lg:px-4">
                    <div className="px-3 py-2 text-sm font-semibold text-foreground">Dashboard</div>
                    <NavLink
                        url={route('dashboard')}
                        active={url.startsWith('/dashboard')}
                        title="Dashboard"
                        icon={IconDashboard}
                    />
                    <div className="px-3 py-2 text-sm font-semibold text-foreground">Laporan Performa</div>
                    <NavLink
                        url={route('admin.reports.index')}
                        active={url.startsWith('/admin/reports')}
                        title="Laporan Performa"
                        icon={IconChartArea}
                    />
                    <div className="px-3 py-2 text-sm font-semibold text-foreground">Peminjaman</div>
                    <NavLink
                        url={route('admin.borroweds.index')}
                        active={url.startsWith('/admin/borroweds')}
                        title="Riwayat Peminjaman"
                        icon={IconCreditCardPay}
                    />
                    <NavLink
                        url={route('admin.loan-statistics.index')}
                        active={url.startsWith('/admin/loan-statistics')}
                        title="Statistik Peminjaman"
                        icon={IconCreditCardPay}
                    />
                    <NavLink url="#" title="Validasi Peminjaman" icon={IconChartDots2} />

                    <div className="px-3 py-2 text-sm font-semibold text-foreground">Pengembalian</div>
                    <NavLink
                        url={route('admin.return-books.index')}
                        active={url.startsWith('/admin/return-books')}
                        title="Validasi Pengembalian"
                        icon={IconCreditCardRefund}
                    />
                    <NavLink url="#" title="Riwayat Pengembalian" icon={IconChartDots2} />

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
                    <NavLink
                        url={route('admin.book-stock-reports.index')}
                        title="Stok Buku"
                        icon={IconStack}
                        active={url.startsWith('/admin/book-stock-reports')}
                    />
                    <NavLink
                        url={route('admin.ebooks.index')}
                        title="E-book"
                        icon={IconNotebook}
                        active={url.startsWith('/admin/ebooks')}
                    />
                   
                    <div className="px-3 py-2 text-sm font-semibold text-foreground">Anggota</div>
                    <NavLink
                        url={route('admin.users.index')}
                        title="Daftar Anggota"
                        icon={IconUsersGroup}
                        active={url.startsWith('/admin/users')}
                    />
                     <NavLink
                        url={route('admin.kelas.index')}
                        title="Kenaikan Kelas"
                        icon={IconUsersGroup}
                        active={url.startsWith('/admin/kelas')}
                    />
                    
                    <div className="px-3 py-2 text-sm font-semibold text-foreground">Peran dan Izin</div>
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
            )}
            {auth.role.some((role) => ['member'].includes(role)) && (
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
                        url={route('front.borroweds.index')}
                        active={url.startsWith('/borroweds')}
                        title="Peminjaman"
                        icon={IconCreditCardPay}
                    />

                    <div className="px-3 py-2 text-sm font-semibold text-foreground">Pengembalian</div>
                    <NavLink
                        url={route('front.return-books.index')}
                        active={url.startsWith('/return-books')}
                        title="Pengembalian"
                        icon={IconCreditCardRefund}
                    />

                    <div className="px-3 py-2 text-sm font-semibold text-foreground">Koleksi Perpustakaan</div>
                    <NavLink
                        url={route('front.books.index')}
                        active={url.startsWith('/books')}
                        title="Buku"
                        icon={IconChartDots2}
                    />
                    <NavLink
                        url={route('front.categories.index')}
                        active={url.startsWith('/categories')}
                        title="Kategori"
                        icon={IconCategory}
                    />
                    <NavLink
                        url={route('front.ebooks.index')}
                        title="E-book"
                        icon={IconNotebook}
                        active={url.startsWith('/ebook')}
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
            )}
        </>
    );
}
