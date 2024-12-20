"use client";

import { useEffect, useState } from "react";
import Typography from "@mui/material/Typography";
import * as React from 'react';
import { styled } from '@mui/material/styles';
import Box from '@mui/material/Box';
import Paper from '@mui/material/Paper';
import Grid from '@mui/material/Grid2';
import Card from '@mui/material/Card';
import CardActions from '@mui/material/CardActions';
import CardContent from '@mui/material/CardContent';
import CardMedia from '@mui/material/CardMedia';
import Button from '@mui/material/Button';
import Stack from '@mui/material/Stack';
import Link from '@mui/material/Link';
import { JobApplicationType } from "../(auth)/types/job_applications_type";

const Item = styled(Paper)(({ theme }) => ({
  backgroundColor: '#fff',
  ...theme.typography.body2,
  padding: theme.spacing(1),
  textAlign: 'center',
  color: theme.palette.text.secondary,
  ...theme.applyStyles('dark', {
    backgroundColor: '#1A2027',
  }),
}));



export default function MyApplication() {
  const [email, setEmail] = useState("");
  const [userid, setUserid] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [jobs, setJobs] = useState<JobApplicationType[]>([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const storedProfile = localStorage.getItem("userProfile");
    if (storedProfile) {
      const profileName = JSON.parse(storedProfile);
      setEmail(profileName.email);
      setUserid(profileName.userid);
    }
  }, []);

  useEffect(() => {
    const myApplications = async () => {
      if (!userid) return;

      try {
        const response = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/api/v1/job_applications`, {
          method: "GET",
          headers: {
            "X-User-Userid": userid,
          },
        });

        if (!response.ok) {
          throw new Error(`HTTP error! Status: ${response.status}`);
        }

        const data: JobApplicationType[] = await response.json();
        setJobs(data);
       
      } catch (err) {
        setError(err instanceof Error ? err.message : "An unexpected error occurred");
      } finally {
        setLoading(false);
      }
    };

    myApplications();
  }, [userid]);


  return (
    <>
    
        <div>
        
          {jobs.map((job) => (
          <Card sx={{marginBottom: '3px' }}>
            <CardContent>
                <Typography gutterBottom variant="h5" component="div"key={job.job_title}>{job.job_title}</Typography>
                <Typography variant="body2" sx={{ color: 'text.secondary' }}> Deadline: {job.deadline}</Typography>
                <Stack direction="row" spacing={2}>
                <Item> <Link href={`${process.env.NEXT_PUBLIC_API_URL}${job.resume.url}`} underline="hover">{job.resume.url.split('/').pop()}</Link></Item>
                <Item> <Link href={`${process.env.NEXT_PUBLIC_API_URL}${job.diplomadegree.url}`} underline="hover">{job.diplomadegree.url.split('/').pop()}</Link></Item>
                <Item> <Link href={`${process.env.NEXT_PUBLIC_API_URL}${job.transcriptdegree.url}`} underline="hover">{job.transcriptdegree.url.split('/').pop()}</Link></Item>
              </Stack>
            </CardContent>
            <CardActions>
              {/* <Button size="small">Revoke</Button> */}
            </CardActions>
              
          </Card>

        
      ))}
      
    </div>
      
    </>
  );
}
