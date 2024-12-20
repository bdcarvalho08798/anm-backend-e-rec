"use client";

import React, { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import Box from "@mui/material/Box";
import Grid from "@mui/material/Grid2";
import Card from "@mui/material/Card";
import CardActions from "@mui/material/CardActions";
import CardContent from "@mui/material/CardContent";
import Button from "@mui/material/Button";
import Typography from "@mui/material/Typography";
import Link from "@mui/material/Link";
import truncate from "html-truncate";
import Chip from "@mui/material/Chip";
import Loading from "../loading";
import SearchBar from "../search-bar";  // Import SearchBar component

type Job = {
  id: number;
  title: string;
  deadline: string;
  description: { body: string };
};

export default function JobLists() {
  const [jobs, setJobs] = useState<Job[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const [searchQuery, setSearchQuery] = useState("");
  const router = useRouter();

  useEffect(() => {
    const fetchJobs = async () => {
      try {
        const response = await fetch(
          `${process.env.NEXT_PUBLIC_API_URL}/api/v1/job_lists`
        );
        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }
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

  const filteredJobs = jobs.filter(
    (job) => job.title.toLowerCase().includes(searchQuery.toLowerCase())
  );


  return (
    <>
  
      <section className="relative before:absolute before:inset-0 before:-z-20 ">
      <div className="mx-auto max-w-8xl px-2 sm:px-2">
      <SearchBar setSearchQuery={setSearchQuery} />
        <div className="grid overflow-hidden sm:grid-cols-2 lg:grid-cols-3 [&>*]:relative [&>*]:p-6 [&>*]:before:absolute [&>*]:before:bg-gray-800 ">
          {filteredJobs.map((job) => (
            <Grid container spacing={0.5} key={job.id}>
              <Card>
                <Box sx={{ flex: 1 }}>
                  <CardContent>
                    <Link href={`/job_detail/${job.id}`} underline="hover">
                      <Typography variant="h6">{job.title || "Job title"}</Typography>
                    </Link>
                    <Typography variant="body2" sx={{ color: "text.secondary" }}>
                      <div
                        dangerouslySetInnerHTML={{
                          __html: truncate(job.description.body, 300),
                        }}
                      />
                    </Typography>
                    <Chip label={`Deadline: ${job.deadline || "Job deadline"}`} />
                  </CardContent>
                </Box>
                <CardActions>
                  <Button
                    size="small"
                    onClick={() => router.push(`/job_detail/${job.id}`)}
                  >
                    View Details
                  </Button>
                  <Button
                    size="small"
                    onClick={() =>
                      router.push(`/job_applications/${job.id}`)
                    }
                  >
                    Apply Now
                  </Button>
                </CardActions>
              </Card>
            </Grid>
          ))}
        </div>
        </div>
      </section>
    </>
  );
}
