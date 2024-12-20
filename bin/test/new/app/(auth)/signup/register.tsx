"use client";

import { useState } from "react";
import { ApplicantUserRegistration } from "../types/user_register";

import * as React from 'react';
import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import CardMedia from '@mui/material/CardMedia';
import Typography from '@mui/material/Typography';
import Button from '@mui/material/Button';
import CardActionArea from '@mui/material/CardActionArea';
import CardActions from '@mui/material/CardActions';
import TextField from '@mui/material/TextField';
import Box from '@mui/material/Box';
import Chip from '@mui/material/Chip';
import Link from '@mui/material/Link';
import { useRouter } from "next/navigation";

const Register: React.FC = () => {
  const [user, setUser] = useState<ApplicantUserRegistration>({
    email: "",
    password: "",
    password_confirmation: "",
  });

  const [message, setMessage] = useState<string>("");
  const [success, setSuccess]= useState(false)
  const router = useRouter();

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setUser({ ...user, [name]: value });
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    try {
      const res = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/api/v1/registrations`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ applicant_user: user }),
      });

      const data = await res.json();

      if (res.ok) {
        setSuccess(true)
        setMessage("User created successfully!");
        user.email="";
        user.password="";
        user.password_confirmation="";
        router.push("/signin");
      } else {
        setSuccess(false)
        setMessage(data.errors.join(", "));
        user.email="";
        user.password="";
        user.password_confirmation="";
      }
    } catch (error) {
      setMessage("An error occurred. Please try again.");
    }
  };

  return (
    <Box
    sx={{ '& .MuiTextField-root': { m: 1 } }}
  >
     <form onSubmit={handleSubmit}>
    <Card sx={{ maxWidth: 345 }}>
  
        
        <CardContent>
            <Typography variant="h5" gutterBottom>
                Register your account
            </Typography>
           
                <TextField
                    fullWidth
                    required
                    name="email"
                    type="email"
                    id="email-required"
                    label="Email"
                    defaultValue=""
                    value={user.email}
                    onChange={handleChange}
                    />

                    <TextField
                    id="outlined-password-input"
                    label="Password"
                    type="password"
                    autoComplete="current-password"
                    name="password"
                    placeholder="Password"
                    value={user.password}
                    onChange={handleChange}
                    required
                    fullWidth
                    />

                    <TextField
                    id="outlined-password-input"
                    label="Password Confirmation"
                    type="password"
                    autoComplete="current-password"
                    name="password_confirmation"
                    placeholder="Confirm Password"
                    value={user.password_confirmation}
                    onChange={handleChange}
                    required
                    fullWidth
                    />
               
               {
                success === true ? (
                    message && <Chip sx={{
                        height: 'auto',
                        '& .MuiChip-label': {
                          display: 'block',
                          whiteSpace: 'normal',
                        },
                      }} label={message} color="success" variant="outlined" />
                ) : (
                    message && <Chip sx={{
                        height: 'auto',
                        '& .MuiChip-label': {
                          display: 'block',
                          whiteSpace: 'normal',
                        },
                      }} label={message} color="error" variant="outlined" />
                )
                }

            
        </CardContent>
     
        <CardActions sx={{alignItems: 'center'}}>
            <Button type="submit" variant="contained">Register</Button>
        </CardActions>
        <CardContent>
        <Link href={`/signin`} underline="hover" sx={{textAlign:'right'}}>
          <Typography>{"Have an account?"}</Typography>
        </Link>
        </CardContent>
    </Card>
    </form>
</Box>

    
  );
};

export default Register;









