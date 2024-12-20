"use client";

import { Button } from "@mui/material";
import { Terminal } from "./terminal";
import { useAuth } from "@/context/AuthContext";



export default function HeroHeader(){
  const { isAuthenticated } = useAuth();

  // console.log("Hero-header Auth: ", isAuthenticated)

    return (

        <section className="py-20">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="lg:grid lg:grid-cols-12 lg:gap-8">
            <div className="sm:text-center md:max-w-2xl md:mx-auto lg:col-span-6 lg:text-left">
              <h1 className="text-4xl font-bold text-gray-900 tracking-tight sm:text-5xl md:text-6xl">
                ANM Timor-Leste
                <span className="block text-blue-900">E-Recruitment Portal</span>
              </h1>
              <p className="mt-3 text-base text-gray-500 sm:mt-5 sm:text-xl lg:text-lg xl:text-xl">
                Launch your SaaS product in record time with our powerful,
                ready-to-use template. Packed with modern technologies and
                essential integrations.
              </p>
              <div className="mt-8 sm:max-w-lg sm:mx-auto sm:text-center lg:text-left lg:mx-0">
                <a
                  href="/signup"
               
                >
                  
                    <Button className="bg-gray-300 hover:bg-blue-900 hover:text-white text-black border border-gray-200 rounded-full text-lg px-8 py-4 inline-flex items-center justify-center">
                      Get Started
                    </Button>
                  
                </a>
              </div>
            </div>
            <div className="mt-12 relative sm:max-w-lg sm:mx-auto lg:mt-0 lg:max-w-none lg:mx-0 lg:col-span-6 lg:flex lg:items-center">
              <Terminal />
            </div>
          </div>
        </div>
      </section>

    );
}