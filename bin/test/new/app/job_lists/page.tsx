
"use client";

import JobLists from "../../components/jobs/job-lists";



import { AuthProvider } from "@/context/AuthContext";

import { useEffect } from "react";

import AOS from "aos";
import "aos/dist/aos.css";

import Header from "@/components/ui/header";
import Footer from "@/components/ui/footer";

export default function JobListsPage(){
 


  return (
    <>
        <AuthProvider> 
            <Header />
            <div className="mt-20"></div> 
            <main className="grow"> <JobLists/> </main>
        </AuthProvider>
      <Footer border={true} />
    </>
  );
}
