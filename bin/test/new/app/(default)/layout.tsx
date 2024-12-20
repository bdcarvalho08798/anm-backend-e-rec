"use client";

import { AuthProvider } from "@/context/AuthContext";

import { useEffect } from "react";

import AOS from "aos";
import "aos/dist/aos.css";

import Header from "@/components/ui/header";
import Footer from "@/components/ui/footer";

export default function DefaultLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  useEffect(() => {
    AOS.init({
      once: true,
      disable: "phone",
      duration: 700,
      easing: "ease-out-cubic",
    });
  });

  return (
    <>
    <AuthProvider> <Header /></AuthProvider>
     

      <main className="grow"><AuthProvider> {children}</AuthProvider> </main>

      <Footer border={true} />
    </>
  );
}
