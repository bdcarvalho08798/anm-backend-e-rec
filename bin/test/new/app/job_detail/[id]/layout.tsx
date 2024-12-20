"use client";

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
      <Header />
      <section>
      <div className="mx-auto mt-20 max-w-6xl px-4 sm:px-6">
        <div
          className="relative overflow-hidden rounded-2xl  shadow-xl before:pointer-events-none before:absolute before:inset-0 before:-z-10 before:rounded-2xl "
          data-aos="zoom-y-out"
        >
          
          <main className="grow">{children}</main>

        </div>
      </div>
    </section>

      <Footer border={true} />
    </>
  );
}
