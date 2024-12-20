"use client";

import { useState } from "react";
import { ApplicantUserLogin } from "../types/user_login";
import * as React from "react";
import Box from "@mui/material/Box";
import TextField from "@mui/material/TextField";
import Card from "@mui/material/Card";
import CardActions from "@mui/material/CardActions";
import CardContent from "@mui/material/CardContent";
import Button from "@mui/material/Button";
import Typography from "@mui/material/Typography";
import Chip from "@mui/material/Chip";
import Link from "@mui/material/Link";
import { useRouter } from "next/navigation";
import { useAuth } from "@/context/AuthContext";

interface UserProfile {
  email: string;
  name: string;
  userid: number;
}

const Login: React.FC = () => {
  const { login } = useAuth();
  const [user, setUser] = useState<ApplicantUserLogin>({
    email: "",
    password: "",
  });
  const [message, setMessage] = useState<string>("");
  const [success, setSuccess] = useState(false);
  const router = useRouter();

  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setUser((prevUser) => ({ ...prevUser, [name]: value }));
  };

  const saveToLocalStorage = (key: string, value: any) => {
    localStorage.setItem(key, JSON.stringify(value));
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      // Login API call
      const loginRes = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/api/v1/sessions`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ applicant_user: user }),
      });

      const loginData = await loginRes.json();

      if (!loginRes.ok) {
        setSuccess(false);
        setMessage(loginData.errors.join(", "));
        setUser({ email: "", password: "" });
        return;
      }

      // Save login data
      login(loginData.token, { email: user.email });
      saveToLocalStorage("token", loginData.token);
      // saveToLocalStorage("user", { email: user.email });

      // Fetch profile data
      const profileRes = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/api/v1/profile`, {
        method: "GET",
        headers: { "X-User-Email": user.email },
      });

      if (!profileRes.ok) {
        throw new Error("Failed to fetch profile");
      }

      const profileData: UserProfile = await profileRes.json();

      // Save entire UserProfile to localStorage
      saveToLocalStorage("userProfile", profileData);

      setSuccess(true);
      setMessage("Login successful!");
      router.push("/"); // Redirect to homepage
    } catch (error) {
      console.error("Error during login or profile fetch:", error);
      setMessage("An error occurred. Please try again.");
    }
  };

  return (
    <Box sx={{ "& .MuiTextField-root": { m: 1 } }}>
      <form onSubmit={handleSubmit}>
        <Card sx={{ maxWidth: 345 }}>
          <CardContent>
            <Typography gutterBottom variant="h5" component="div">
              Login to your account
            </Typography>

            <TextField
              id="email"
              label="Email"
              variant="outlined"
              type="email"
              name="email"
              placeholder="Email"
              value={user.email}
              onChange={handleChange}
              required
              fullWidth
            />

            <TextField
              id="password"
              label="Password"
              variant="outlined"
              type="password"
              name="password"
              placeholder="Password"
              value={user.password}
              onChange={handleChange}
              required
              fullWidth
            />

            {message && (
              <Chip
                sx={{
                  height: "auto",
                  "& .MuiChip-label": {
                    display: "block",
                    whiteSpace: "normal",
                  },
                }}
                label={message}
                color={success ? "success" : "error"}
                variant="outlined"
              />
            )}
          </CardContent>
          <CardActions>
            <Button type="submit" variant="contained">
              Login
            </Button>
          </CardActions>
          <CardContent>
            <Link href={`/signup`} underline="hover" sx={{ textAlign: "right" }}>
              <Typography>{"Not have an account?"}</Typography>
            </Link>
          </CardContent>
        </Card>
      </form>
    </Box>
  );
};

export default Login;
