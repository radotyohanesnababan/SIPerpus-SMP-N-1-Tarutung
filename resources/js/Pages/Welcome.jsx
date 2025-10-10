import HeaderTitle from '@/Components/HeaderTitle';
import WelcomeLayout from '@/Layouts/WelcomeLayout';
import { IconWashEco } from '@tabler/icons-react';

export default function Welcome(props) {
    const auth = props.auth.user;
    return (
        <div className="flex flex-col w-full pb-32 space-y-4">
           <div className="flex flex-col items-center justify-center gap-y-4 lg:flex-row lg:items-center lg:justify-center">
                <HeaderTitle
                    title={props.page_settings.title}
                    subtitle={props.page_settings.subtitle}
                    icon={IconWashEco}
                ></HeaderTitle>
            </div>
        </div>
    );
}

Welcome.layout = (page) => <WelcomeLayout children={page} title="Welcome" />;
