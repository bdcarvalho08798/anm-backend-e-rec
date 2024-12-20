"use client";

import React, { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import Box from "@mui/material/Box";
import Card from "@mui/material/Card";
import CardActions from "@mui/material/CardActions";
import CardContent from "@mui/material/CardContent";
import Button from "@mui/material/Button";
import Typography from "@mui/material/Typography";
import Link from "@mui/material/Link";
import truncate from "html-truncate";
import Chip from "@mui/material/Chip";
import Loading from "../loading";
import Grid from "@mui/material/Grid2";
import SearchBar from "../search-bar";
import { useAuth } from "@/context/AuthContext";
import { JobApplicationType } from "@/app/(auth)/types/job_applications_type";

type Job = {
  id: number;
  title: string;
  deadline: string;
  description: { body: string };
};

export default function JobListsLimit() {
  const [jobs, setJobs] = useState<Job[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [searchQuery, setSearchQuery] = useState("");
  const [jobApps, setJobApps] = useState<JobApplicationType[]>([]);
  const [name, setName] = useState<string>("");

  const { isAuthenticated } = useAuth();
  const router = useRouter();

  useEffect(() => {
    const storedProfile = localStorage.getItem("userProfile");
    if (storedProfile) {
      const profile = JSON.parse(storedProfile);
      setName(profile.name || "");
    }
  }, []);

  useEffect(() => {
    const fetchApplications = async () => {
      try {
        const storedProfile = localStorage.getItem("userProfile");
        const userId = storedProfile ? JSON.parse(storedProfile).userid : null;

        if (!userId) return;

        const response = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/api/v1/job_applications`, {
          headers: { "X-User-Userid": userId },
        });

        if (!response.ok) throw new Error(`Failed to fetch job applications: ${response.statusText}`);

        const data: JobApplicationType[] = await response.json();
        setJobApps(data);
      } catch (err) {
        setError(err instanceof Error ? err.message : "An unexpected error occurred");
      } finally {
        setLoading(false);
      }
    };

    fetchApplications();
  }, []);

  useEffect(() => {
    const fetchJobs = async () => {
      try {
        const response = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/api/v1/job_lists`);
        if (!response.ok) throw new Error(`Failed to fetch jobs: ${response.statusText}`);

        const data: Job[] = await response.json();
        setJobs(data);
      } catch (err) {
        setError(err instanceof Error ? err.message : "An unexpected error occurred");
      } finally {
        setLoading(false);
      }
    };

    fetchJobs();
  }, []);

  if (loading) return <Loading />;
  if (error) return <Typography color="error">Error: {error}</Typography>;

  const filteredJobs = jobs.filter((job) =>
    job.title.toLowerCase().includes(searchQuery.toLowerCase())
  );

  const isJobApplied = (jobId: number) =>
    jobApps.some((jobApp) => jobApp.job_list_id === jobId);

  return (
    <>
      {isAuthenticated && (
        <section className="py-20 bg-blue-200">
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div className="lg:grid lg:grid-cols-12 lg:gap-8 bg-blue-200">
              <div className="sm:text-center md:max-w-2xl md:mx-auto lg:col-span-6 lg:text-left">
                <h1 className="text-4xl font-bold text-gray-900 tracking-tight sm:text-5xl md:text-4xl">
                  Welcome, <span className="block text-blue-900">{name || "Guest, please update your profile."}</span>
                </h1>
              </div>
              <div className="mt-12 sm:max-w-lg sm:mx-auto lg:mt-0 lg:max-w-none lg:mx-0 lg:col-span-6 lg:flex lg:items-center bg-gray-100 rounded-full">
                <SearchBar setSearchQuery={setSearchQuery} />
              </div>
            </div>
          </div>
        </section>
      )}
      <section className="relative  mb-3">
        {!isAuthenticated && <SearchBar setSearchQuery={setSearchQuery} />}
        <div className="mt-3 mx-auto max-w-6xl px-4 sm:px-4">
          <div className="grid sm:grid-cols-2 lg:grid-cols-3 gap-4">
            {filteredJobs.slice(0, 6).map((job) => (
              <Card key={job.id}>
                <CardContent>
                  <Link href={`/job_detail/${job.id}`} underline="hover">
                    <Typography variant="h6">{job.title || "Job Title"}</Typography>
                  </Link>
                  <Typography variant="body2" color="text.secondary">
                    <div dangerouslySetInnerHTML={{ __html: truncate(job.description.body, 100) }} />
                  </Typography>
                  <Chip label={`Deadline: ${job.deadline || "No Deadline"}`} />
                </CardContent>
                <CardActions>
                  <Button size="small" onClick={() => router.push(`/job_detail/${job.id}`)}>
                    View Details
                  </Button>
                  {isAuthenticated ? (
                    isJobApplied(job.id) ? (
                      <Typography variant="body2" color="text.success">
                        Applied
                      </Typography>
                    ) : (
                      <Button size="small" onClick={() => router.push(`/job_applications/${job.id}`)}>
                        Apply Now
                      </Button>
                    )
                  ) : (
                    <Button size="small" onClick={() => router.push(`/job_applications/${job.id}`)}>
                      Apply Now
                    </Button>
                  )}
                </CardActions>
              </Card>
            ))}
          </div>
        </div>
      </section>
    </>
  );
}
