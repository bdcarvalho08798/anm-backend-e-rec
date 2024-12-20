"use client";

import { useEffect, useState } from "react";
import { AuthProvider } from "@/context/AuthContext";
import { useRouter } from "next/navigation";
import Loading from "@/components/loading";
import { useAuth } from "@/context/AuthContext";



export default function ChangePasswordLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  useEffect(() => {
   
  });

  const [isAuthChecked, setIsAuthChecked] = useState(true);
  const { isAuthenticated, logout } = useAuth();
  const router = useRouter();
  useEffect(() => {
    if (isAuthenticated === false) {
      router.push("/signin");
    } else {
      setIsAuthChecked(true);
    }
  }, [isAuthenticated, router]);

  return (
    <>
      
      <section>
      <div className="mx-auto max-w-6xl px-4 sm:px-6">
        <div
          className="relative overflow-hidden rounded-2xl  shadow-xl before:pointer-events-none before:absolute before:inset-0 before:-z-10 before:rounded-2xl "
          data-aos="zoom-y-out"
        >
          
          <main className="grow"><AuthProvider>{children}</AuthProvider></main>

    </div>
    </div>
    </section>

    </>
  );
}
