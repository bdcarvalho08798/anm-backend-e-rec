"use client";

import { useEffect, useState } from "react";
import {
  Card,
  CardContent,
  Typography,
  Button,
  CardActions,
  TextField,
  Box,
  Chip,
} from "@mui/material";
import { useRouter } from "next/navigation";
import { useAuth } from "@/context/AuthContext";

interface UserChangePassword {
  email: string;
  old_password: string;
  new_password: string;
  password_confirmation: string;
}

export default function ChangePassword() {
  const { user } = useAuth(); // Fetch the logged-in user's details
  const [userData, setUserData] = useState<UserChangePassword>({
    email: "", // Initialize with an empty string
    old_password: "",
    new_password: "",
    password_confirmation: "",
  });

  const [message, setMessage] = useState<string>("");
  const [success, setSuccess] = useState<boolean | null>(null);
  const router = useRouter();

  useEffect(() => {
    if (user?.email) {
      setUserData((prevData) => ({ ...prevData, email: user.email }));
      console.log("EMAIL:", user.email);
    }
  }, [user]); // Update email when `user` changes

  // Handle input changes
  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setUserData((prevData) => ({ ...prevData, [name]: value }));
  };

  // Handle form submission
  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
  
    try {
      const token = localStorage.getItem("token"); // Retrieve token from localStorage
      const userProfile = JSON.parse(localStorage.getItem("userProfile") || "{}");
  
      const response = await fetch(
        `${process.env.NEXT_PUBLIC_API_URL}/api/v1/change_password`,
        {
          method: "PATCH",
          headers: {
            "Content-Type": "application/json",
            "Authorization": `Bearer ${token}`, // Send the token
            "X-User-Email": userProfile.email, // Send the user's email
          },
          body: JSON.stringify({
            applicant_user: userData,
          }),
        }
      );
  
      const data = await response.json();
  
      if (response.ok) {
        setMessage("Password updated successfully!");
        setSuccess(true);
        router.push("/profile");
      } else {
        setMessage(data.errors?.join(", ") || "Failed to update password.");
        setSuccess(false);
      }
    } catch (error) {
      console.error("An error occurred:", error);
      setMessage("An error occurred. Please try again.");
      setSuccess(false);
    }
  };
  

  return (
    <div className="w-full flex flex-col justify-center items-center">
      <Box sx={{ maxWidth: 400, width: "100%" }}>
        <form onSubmit={handleSubmit}>
          <Card>
            <CardContent>
              <Typography variant="h5" gutterBottom>
                Change Password
              </Typography>

              <TextField
                fullWidth
                required
                name="email"
                type="email"
                label="Email"
                value={userData.email}
                disabled // Disable the email field
                sx={{ mb: 2 }}
              />

              <TextField
                fullWidth
                required
                name="old_password"
                type="password"
                label="Old Password"
                value={userData.old_password}
                onChange={handleChange}
                sx={{ mb: 2 }}
              />

              <TextField
                fullWidth
                required
                name="new_password"
                type="password"
                label="New Password"
                value={userData.new_password}
                onChange={handleChange}
                sx={{ mb: 2 }}
              />

              <TextField
                fullWidth
                required
                name="password_confirmation"
                type="password"
                label="Confirm Password"
                value={userData.password_confirmation}
                onChange={handleChange}
                sx={{ mb: 2 }}
              />

              {message && (
                <Chip
                  label={message}
                  color={success ? "success" : "error"}
                  variant="outlined"
                  sx={{ mt: 1, mb: 2 }}
                />
              )}
            </CardContent>
            <CardActions sx={{ justifyContent: "center" }}>
              <Button type="submit" variant="contained" color="primary">
                Update Password
              </Button>
            </CardActions>
          </Card>
        </form>
      </Box>
    </div>
  );
}
