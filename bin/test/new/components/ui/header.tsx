"use client";
import Link from "next/link";
import Logo from "./logo";
import { useAuth } from "@/context/AuthContext";
import Chip from '@mui/material/Chip';
import Avatar from '@mui/material/Avatar';
import React, { useEffect, useState } from "react";

export default function Header() {
  const { isAuthenticated, logout } = useAuth();

 
  const [photo, setPhoto] = useState("");

  useEffect(() => {
    const storedProfile = localStorage.getItem("userProfile");
    if (storedProfile) {
      const profileName = JSON.parse(storedProfile);
      setPhoto(profileName.user_avatar.thumb.url)
    }
  }, []);

  const handleLogout = () => {
    logout();
    window.location.href = "/";
  };

  return (
    <header className="fixed top-1 z-30 w-full md:top-3">
      <div className="">
        <div className="relative flex h-14 items-center justify-between gap-3 rounded-2xl bg-white/90 px-3 shadow-lg shadow-black/[0.03] backdrop-blur-sm before:pointer-events-none before:absolute before:inset-0 before:rounded-[inherit] before:border before:border-transparent before:[background:linear-gradient(theme(colors.gray.100),theme(colors.gray.200))_border-box] before:[mask-composite:exclude_!important] before:[mask:linear-gradient(white_0_0)_padding-box,_linear-gradient(white_0_0)]">
          {/* Site branding */}
          <div className="flex flex-1 items-center">
            <Logo />
          </div>

          {/* Navigation Links */}
          <ul className="flex flex-1 items-center justify-end gap-3">
            {!isAuthenticated ? (
              <>
                <li>
                  <Link
                    href="/signin"
                    className="btn-sm bg-blue-900 text-white shadow hover:bg-blue-600"
                  >
                    Login
                  </Link>
                </li>
                <li>
                  <Link
                    href="/signup"
                    className="btn-sm bg-gray-800 text-white shadow hover:bg-gray-600"
                  >
                    Register
                  </Link>
                </li>
              </>
            ) : (
              <>
                <li>
                  
                  <Link
                    href="/profile"
                    
                  >
                    <Chip
                      avatar={
                        <Avatar 
                          alt="User" 
                          src={`${process.env.NEXT_PUBLIC_API_URL}${photo}`} 
                        />
                      }
                      label="My Profile"
                      className="bg-gray-400 text-black shadow hover:bg-blue-600"
                    />
                  </Link>
                </li>
                <li>
                  <button
                    onClick={handleLogout}
                    className="btn-sm bg-red-600 text-white shadow hover:bg-red-700"
                  >
                    Logout
                  </button>
                </li>
              </>
            )}
          </ul>
        </div>
      </div>
    </header>
  );
}
