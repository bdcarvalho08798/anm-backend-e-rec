export  type JobApplicationType = {
    applicant_user_id: number;
    job_title: string;
    job_list_id: number;
    deadline: string;
    description: { body: string }
    resume:  { url: string; };
    diplomadegree:  { url: string; };
    transcriptdegree:  { url: string; };
  };