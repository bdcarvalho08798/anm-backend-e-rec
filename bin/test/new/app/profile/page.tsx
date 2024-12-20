"use client";

import ProfileMenuTabs from "@/components/profile-menu-tab";
import React, { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import Loading from "@/components/loading";
import { useAuth } from "@/context/AuthContext";

export default function MyProfile(){
    const router = useRouter();
    const [loading, setLoading] = useState(true);
    const [isAuthChecked, setIsAuthChecked] = useState(false);
    const { isAuthenticated, logout } = useAuth();
    useEffect(() => {
        if (isAuthenticated === false) {
          router.push("/signin");
        } else {
          setIsAuthChecked(true);
        }
      }, [isAuthenticated, router]);
    return (
        <>
            <ProfileMenuTabs />
        </>
    );
}