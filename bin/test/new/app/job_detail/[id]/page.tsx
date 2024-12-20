"use client";

import { useEffect, useState } from "react";
import { useParams } from "next/navigation";
import * as React from 'react';
import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import CardMedia from '@mui/material/CardMedia';
import Typography from '@mui/material/Typography';
import Button from '@mui/material/Button';
import CardActionArea from '@mui/material/CardActionArea';
import CardActions from '@mui/material/CardActions';
import { Box } from "@mui/material";
import { useRouter } from "next/navigation";
import Link from 'next/link'; 
import ArrowBackIosIcon from '@mui/icons-material/ArrowBackIos';
import { FactCheckSharp } from "@mui/icons-material";
import Stack from '@mui/material/Stack';
import Chip from '@mui/material/Chip';
import Loading from "@/components/loading";
import { useAuth } from "@/context/AuthContext";
import { useSearchParams } from "next/navigation";

type JobEssentialCriteria = {
  id: number;
  job_list_id: number;
  name: string;
};

type Job = {
  id: number;
  title: string;
  deadline: string;
  description: { body: string } 
  job_essential_critria_lists: JobEssentialCriteria[];
};


export default function JobDetail() {
  const { id } = useParams() ?? {};
  const searchParams = useSearchParams();
  const jobListId = searchParams ? searchParams.get("id") : null;

  const [job, setJob] = useState<Job | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState<string | null>(null);
  const { isAuthenticated, logout } = useAuth();

  useEffect(() => {
    if (id) {
      const fetchJobDetails = async () => {
        try {
          const response = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/api/v1/job_lists/${id}`);
          if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
          }
          const data: Job = await response.json();
          setJob(data);
          setLoading(false);
        } catch (err) {
          setError("An error occurred while fetching job details.");
          setLoading(false);
        }
      };

      fetchJobDetails();
    }
  }, [id]);

  const router = useRouter();
  const handleBackClick = () => {
    // Navigate back to the previous page
    router.back();
  };

  console.log("isAuthenticated in job list: ",isAuthenticated)


  if (loading) return <Loading />;
  if (error) return <Typography color="error">Error: {error}</Typography>;
  if (!job) return <Typography>No job details found.</Typography>;

  return (
    
          <Box component="section" sx={{ p: 2 }}>
          <Card >
            <CardActionArea>
              <CardContent>
                <Typography gutterBottom variant="h5" component="div">
                {job.title}
                </Typography>
                <Stack direction="row" spacing={1}>
                <Chip label={`Deadline: ${job.deadline || "Job deadline"}`} />
              </Stack>
                <Typography variant="body2" sx={{ color: 'text.secondary' }}>
                <div
                  dangerouslySetInnerHTML={{ __html: job.description.body }}
                />
                </Typography>
                <table className="border border-slate-500 mx-auto mt-5 mb-2">
                <tr>
                                <th className="border border-slate-700 px-4 py-2" colSpan={2}>
                                  <Typography variant="h6" gutterBottom>
                                    Job Essential Criteria Responses
                                  </Typography>
                                </th>
                              </tr>
                              {job?.job_essential_critria_lists.map((criteria, index) => (
                                <tr key={index}>
                                  <td className="border border-slate-600 px-4 py-2">{index + 1}</td>
                                  <td className="border border-slate-600 px-4 py-2">{criteria.name}</td>
                                </tr>
                              ))}
                  </table>
              </CardContent>
              
            </CardActionArea>
            <CardActions>
            <Button
              variant="contained"
              startIcon={<ArrowBackIosIcon />}
              onClick={handleBackClick}
              >
              BACK
            </Button>
            
              <Link href={`/job_applications/${job.id}`} passHref>
                  <Button variant="contained" endIcon={<FactCheckSharp />}>
                    Apply
                  </Button>
              </Link>
            </CardActions>
          </Card>
          </Box>
  );
}
