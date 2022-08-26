import UserDashboard from "../components/UserDashboard";
import ProviderDashboard from "../components/ProviderDashboard";
import LoadingSpinner from "../components/LoadingSpinner";
import { useNavigate } from "react-router-dom";


function DashboardPage({ user, isProvider, pets, bases }) {
    let navigate = useNavigate()
    let timeoutID;
    if (!user) {
        timeoutID = setTimeout(()=>{navigate('/login', {replace:true})},2000)
        return (
            <div>
                <LoadingSpinner />
            </div>
        )

    }
    else if (isProvider) {
        clearTimeout(timeoutID)
        return (
            <div>
                <ProviderDashboard user={user} bases={bases} />
            </div>
        )
    }
    else {
        clearTimeout(timeoutID)
        return (
            <div>
                <UserDashboard user={user} pets={pets} bases={bases} />
            </div>
        )
    }

}

export default DashboardPage;