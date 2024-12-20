"use client";

import JobListsLimit from "./jobs/job-lists-limit";
import { Button } from "@mui/material";

import { useRouter } from "next/navigation";
import SearchBar from "./search-bar";
import { useAuth } from "@/context/AuthContext";


export default function TopSection() {
  const { isAuthenticated } = useAuth();
  
  const router = useRouter();
  return (
    <>
   
            <JobListsLimit/>
           
       
    <section className="relative before:absolute before:inset-0 before:-z-20 ">
    <div className="mx-auto max-w-6xl px-4 sm:px-6">
     <Button variant="contained" onClick={() => router.push(`/job_lists`)}>
        View All Jobs
    </Button>
    </div>
    </section>
</>
  );
}
