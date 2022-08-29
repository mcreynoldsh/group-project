import React, { useEffect } from 'react'
import { useNavigate } from "react-router-dom";

function LoadingSpinner() {
    let navigate = useNavigate()
   
    useEffect(() => {
        const timer = setTimeout(() => navigate("/login", {replace:true}), 2000);
        return () => clearTimeout(timer);
        }, []);
    
    return (
        <div className="spinner-container">
            <div className="loading-spinner">
            </div>
        </div>
    )
}

export default LoadingSpinner