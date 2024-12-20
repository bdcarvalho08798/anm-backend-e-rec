"use client";

import React, { useEffect, useState } from "react";
import { useSearchParams } from "next/navigation";
import { Box, TextField, Button, Typography, CardActionArea, CardContent, Card } from "@mui/material";
import { useRouter } from "next/navigation";
import Loading from "@/components/loading";
import { useAuth } from "@/context/AuthContext";
import List from '@mui/material/List';
import ListItemButton from '@mui/material/ListItemButton';
import { useParams } from "next/navigation";
import Paper from '@mui/material/Paper';
import Stack from '@mui/material/Stack';
import { styled } from '@mui/material/styles';



type JobEssentialCriteria = {
  id: number;
  job_list_id: number;
  name: string;
};

type JobDetails = {
  id: number;
  title: string;
  deadline: string,
  description: {
    body: string;
  };
  job_essential_critria_lists: JobEssentialCriteria[];
};


export default function JobApplication() {
  const { id } = useParams() ?? {};
  const searchParams = useSearchParams();
  // const jobListId = searchParams ? searchParams.get("job_list_id") : null;


  const router = useRouter();
  const [step, setStep] = useState(1);
  const [email, setEmail] = useState("");
  const [resume, setResume] = useState<File | null>(null);
  const [diplomadegree, setDiplomadegree] = useState<File | null>(null);
  const [transcriptdegree, setTranscriptdegree] = useState<File | null>(null);
  const [error, setError] = useState<string | null>(null);
  const [success, setSuccess] = useState<boolean>(false);
  const [loading, setLoading] = useState(true);
  const [isAuthChecked, setIsAuthChecked] = useState(false);

  const [userid, setUserid] = useState();
  

  const [jobDetails, setJobDetails] = useState<JobDetails | null>(null);
  const [responses, setResponses] = useState<{ [key: number]: string }>({});

  const { isAuthenticated, logout } = useAuth();

  const [open, setOpen] = React.useState(false);

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


  useEffect(() => {
    if (isAuthenticated === false) {
      router.push("/signin");
    } else {
      setIsAuthChecked(true);
    }
  }, [isAuthenticated, router]);

  useEffect(() => {
    if (id) {
      const fetchJobDetails = async () => {
        try {
          const response = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/api/v1/job_lists/${id}`);
          const data = await response.json();
          setJobDetails(data);
          setLoading(false);
        } catch (error) {
          setError("Error fetching job details.");
          setLoading(false);
        }
      };
      fetchJobDetails();
    }
  }, [id]);

  const handleNext = () => {
    if (step === 1 && !email) {
      setError("Please provide an email.");
      return;
    }
    if (step === 2) {
      if (!resume) {
        setError("Please upload a resume.");
        return;
      } else if (!diplomadegree) {
        setError("Please upload your diploma degree.");
        return;
      } else if (!transcriptdegree) {
        setError("Please upload your transcript degree.");
        return;
      }
    }
    if (step === 3) {
      // Check if all required fields are filled
      const unfilledCriteria =
      jobDetails?.job_essential_critria_lists?.filter(
        (criteria) => !responses[criteria.id] || responses[criteria.id].trim() === ""
      ) || [];
  
      if (unfilledCriteria && unfilledCriteria.length > 0) {
        setError(`Please fill out all required fields: ${unfilledCriteria.map(c => c.name).join(", ")}`);
        return;
      }
    }

    setError(null);
    setStep((prev) => prev + 1);
  };

  const handleBack = () => {
    setError(null);
    setStep((prev) => prev - 1);
  };

  const handleInputChange = (criteriaId: number, value: string) => {
    setResponses((prevResponses) => ({
      ...prevResponses,
      [criteriaId]: value,
    }));
  };

  const handleSubmit = async (event: React.FormEvent) => {
    event.preventDefault();
    setLoading(true);

    const formData = new FormData();
    formData.append("job_application[job_list_id]", id as string);
    formData.append("job_application[email]", email);
    formData.append("job_application[applicant_user_id]", userid || "");
    formData.append("job_application[resume]", resume!);
    formData.append("job_application[diplomadegree]", diplomadegree!);
    formData.append("job_application[transcriptdegree]", transcriptdegree!);

    // Add job essential criteria responses to formData
    jobDetails?.job_essential_critria_lists.forEach((criteria) => {
      formData.append(
        `job_application[job_essential_criteria_responses_attributes][${criteria.id}][response]`,
        responses[criteria.id] || ""
      );
    });

    try {
      const response = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/api/v1/job_applications`, {
        method: "POST",
        body: formData,
      });

      if (!response.ok) {
        const responseData = await response.json();
        throw new Error(`Error: ${responseData.error || response.status}`);
      }

      const data = await response.json();
      setSuccess(true);

      setTimeout(() => {
        setLoading(false);
        router.push(`/`);
      }, 5000);
    } catch (err) {
      setError("An error occurred while submitting your application.");
      setLoading(false);
    }
  };

  useEffect(() => {
    const storedProfile = localStorage.getItem("userProfile");
    if (storedProfile) {
      const parsedProfile = JSON.parse(storedProfile);
      setUserid(parsedProfile.userid); // Access the user ID
      setEmail(parsedProfile.email); // Access the user email
      // console.log("USER ID: ",parsedProfile.userid)
    }
  }, []);

  if (!isAuthChecked || loading) return <Loading />;
  if (loading) return <Loading />;

  return (
    <>
      <Card>
        <CardActionArea>
          <CardContent>
            <Typography variant="h5" gutterBottom>
              Apply for Job: {jobDetails?.title}
            </Typography>
           
            <List>
              <ListItemButton>
                  <Typography>
                  Deadline: {jobDetails?.deadline}
                </Typography>
              </ListItemButton>
               
               
              </List>
            </CardContent>
        </CardActionArea>
      </Card>
      <Card>
        <CardActionArea>
          <CardContent>
            {error && <Typography color="error">{error}</Typography>}
            {success && <Typography color="success.main">Application submitted successfully!</Typography>}

            <form onSubmit={handleSubmit}>
              {step === 1 && (
                <>
                <TextField
                    fullWidth
                    label="userid"
                    
                   
                    type="number"
                    value={userid}
                    required
                    sx={{ display: 'none' }}
                    />

                  <TextField
                    fullWidth
                    label="Email"
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
                    type="email"
                    required
                    sx={{ mb: 2 , width: '40ch' }}
                    /><br />
                  <Button variant="contained" color="primary" onClick={handleNext}>
                    Next
                  </Button>
                </>
              )}

              {step === 2 && (
                <>
                  <Stack
                    direction={{ xs: 'column', sm: 'row' }}
                    spacing={{ xs: 1, sm: 2, md: 4 }}
                  >
                    <Item> 
                      <Button variant="outlined" component="label" sx={{ mb: 2 }}>
                        Upload Resume
                        <input
                          type="file"
                          hidden
                          accept=".pdf,.doc,.docx"
                          onChange={(e) => setResume(e.target.files ? e.target.files[0] : null)}
                        />
                      </Button>
                      {resume && <Typography variant="body2" sx={{ mb: 2 }}>Selected File: {resume.name}</Typography>}
                    </Item>
                    <Item>
                    <Button variant="outlined" component="label" sx={{ mb: 2 }}>
                    Upload Diploma Degree
                    <input
                      type="file"
                      hidden
                      accept=".pdf,.doc,.docx"
                      onChange={(e) => setDiplomadegree(e.target.files ? e.target.files[0] : null)}
                    />
                  </Button>
                  {diplomadegree && <Typography variant="body2" sx={{ mb: 2 }}>Selected File: {diplomadegree.name}</Typography>}
                    </Item>
                    <Item>
                    <Button variant="outlined" component="label" sx={{ mb: 2 }}>
                    Upload Transcript Degree
                    <input
                      type="file"
                      hidden
                      accept=".pdf,.doc,.docx"
                      onChange={(e) => setTranscriptdegree(e.target.files ? e.target.files[0] : null)}
                    />
                  </Button>
                  {transcriptdegree && <Typography variant="body2" sx={{ mb: 2 }}>Selected File: {transcriptdegree.name}</Typography>}
                    </Item>
                  </Stack>
                 <br />
                  <Box sx={{ display: "flex", justifyContent: "space-between" }}>
                    <Button variant="contained" color="secondary" onClick={handleBack}>
                      Back
                    </Button>
                    <Button variant="contained" color="primary" onClick={handleNext}>
                      Next
                    </Button>
                  </Box>
                </>
              )}

              {step === 3 && jobDetails && jobDetails.job_essential_critria_lists?.length > 0 && (
                <>
                  <Typography variant="h6" gutterBottom>
                    Job Essential Criteria
                  </Typography>
                  
                  {jobDetails.job_essential_critria_lists.map((criteria) => (
                    <TextField
                      key={criteria.id}
                      label={criteria.name}
                      fullWidth
                      multiline
                      required
                      sx={{ mb: 2 }}
                      value={responses[criteria.id] }
                      onChange={(e) => handleInputChange(criteria.id, e.target.value)}
                    />
                  ))}
                  <Box sx={{ display: 'flex', justifyContent: 'space-between' }}>
                    <Button variant="contained" color="secondary" onClick={handleBack}>
                      Back
                    </Button>
                    <Button variant="contained" color="primary" onClick={handleNext}>
                      Next
                    </Button>
                  </Box>
                </>
              )}

              {step === 4 && (
                <>
                  <Typography variant="h6" gutterBottom>
                    Review Your Application
                  </Typography>
                    <table className="border border-slate-500 mx-auto mt-5 mb-2">
                      <thead>
                        <tr>
                          <th className="border border-slate-600 px-4 py-2">Email</th>
                          <td className="border border-slate-700 px-4 py-2">{email}</td>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                        <th className="border border-slate-600 px-4 py-2">Resume</th>
                          <td className="border border-slate-700 px-4 py-2">{resume?.name}</td>
                        </tr>
                        <tr>
                          <th className="border border-slate-700 px-4 py-2">Diploma Degree</th>
                          <td className="border border-slate-700 px-4 py-2">{diplomadegree?.name}</td>
                        </tr>
                        <tr>
                          <th className="border border-slate-700 px-4 py-2">Transcript Degree</th>
                          <td className="border border-slate-700 px-4 py-2">{transcriptdegree?.name}</td>
                        </tr>
                        {jobDetails?.job_essential_critria_lists && jobDetails.job_essential_critria_lists.length > 0 && (
                              <tr>
                                <th className="border border-slate-700 px-4 py-2" colSpan={2}>
                                  <Typography variant="h6" gutterBottom>
                                    Job Essential Criteria Responses
                                  </Typography>
                                </th>
                              </tr>
                            )}
                            {jobDetails?.job_essential_critria_lists.map((criteria) => (
                              <tr key={criteria.id}>
                                <th className="border border-slate-600 px-4 py-2">{criteria.name}</th>
                                <td className="border border-slate-700 px-4 py-2">
                                  {responses[criteria.id] || "Not provided"}
                                </td>
                              </tr>
                            ))}
                      </tbody>
                    </table>

                  <Box sx={{ display: 'flex', justifyContent: 'space-between' }}>
                    <Button variant="contained" color="secondary" onClick={handleBack}>
                      Back
                    </Button>
                    <Button variant="contained" color="primary" type="submit">
                    Submit
                  </Button>
                  </Box>
                  
                </>
              )}
            </form>
            </CardContent>
          </CardActionArea>
        </Card>
       
</>
  );
}
