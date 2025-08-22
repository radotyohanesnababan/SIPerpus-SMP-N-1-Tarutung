import ApplicationLogo from '@/Components/ApplicationLogo';
import NavLinkResponsive from '@/Components/NavLinkResponsive';
import {
    IconChartDots2,
    IconCreditCardPay,
    IconCreditCardRefund,
    IconDashboard,
    IconUsersGroup,
} from '@tabler/icons-react';

export default function SidebarResponsive({ url, auth }) {
    return (
        <nav className="grid gap-6 text-lg font-medium">
            <ApplicationLogo />
            <nav className="grid  items-start  text-sm font-semibold lg:px-4">
                <div className="px-3 py-2 text-sm font-semibold text-foreground">Dashboard</div>
                <NavLinkResponsive
                    url={route('dashboard')}
                    active={url.startsWith('/dashboard')}
                    title="Dashboard"
                    icon={IconDashboard}
                />

                <div className="px-3 py-2 text-sm font-semibold text-foreground">Peminjaman</div>
                <NavLinkResponsive
                    url={route('admin.borroweds.index')}
                    active={url.startsWith('/admin/borrowed')}
                    title="Riwayat Peminjaman"
                    icon={IconCreditCardPay}
                />
                <NavLinkResponsive url="#" title="Validasi Peminjaman" icon={IconChartDots2} />

                <div className="px-3 py-2 text-sm font-semibold text-foreground">Pengembalian</div>
                <NavLinkResponsive
                    url={route('admin.return-books.index')}
                    active={url.startsWith('/admin/return-books')}
                    title="Riwayat Pengembalian"
                    icon={IconCreditCardRefund}
                />
                <NavLinkResponsive url="#" title="Validasi Pengembalian" icon={IconChartDots2} />

                <div className="px-3 py-2 text-sm font-semibold text-foreground">Master</div>
                <NavLinkResponsive
                    url={route('admin.books.index')}
                    active={url.startsWith('/admin/books')}
                    title="Buku"
                    icon={IconChartDots2}
                />
                <NavLinkResponsive
                    url={route('admin.publishers.index')}
                    active={url.startsWith('/admin/publishers')}
                    title="Penerbit"
                    icon={IconChartDots2}
                />
                <NavLinkResponsive
                    url={route('admin.categories.index')}
                    active={url.startsWith('/admin/categories')}
                    title="Kategori"
                    icon={IconChartDots2}
                />
                <NavLinkResponsive url="#" title="Stok Buku" icon={IconChartDots2} />
                <NavLinkResponsive url="#" title="E-book" icon={IconChartDots2} />
                <NavLinkResponsive
                    url={route('admin.users.index')}
                    title="Anggota"
                    icon={IconUsersGroup}
                    active={url.startsWith('/admin/users')}
                />

                <div className="px-3 py-2 text-sm font-semibold text-foreground">Lainnya</div>
                <NavLinkResponsive url="#" title="Pengumuman" icon={IconChartDots2} />
                <NavLinkResponsive url={route('profile.edit')} title="Profil" icon={IconChartDots2} />
            </nav>
        </nav>
    );
}
