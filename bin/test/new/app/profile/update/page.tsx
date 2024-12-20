"use client";

import { useEffect, useState } from "react";
import { useAuth } from "@/context/AuthContext";
import { TextField, Button, Box } from "@mui/material";
import Stack from '@mui/material/Stack'; 
import { useRouter } from "next/navigation";

interface Profile {
  name: string;
  email: string;
  user_avatar: File | null; // Ensure user_avatar is of type File or null
}

const EditProfile = () => {
  const { user } = useAuth(); // Assuming `user` contains the logged-in user's email

  const router = useRouter();

  const [profile, setProfile] = useState<Profile>({
    name: "",
    email: user?.email || "",
    user_avatar: null, // Set initial user_avatar to null
  });

  const [message, setMessage] = useState<string | null>(null);
  const [error, setError] = useState<string | null>(null);

  // Fetch the existing profile when the component mounts
  useEffect(() => {
    const fetchProfile = async () => {
      try {
        if (!user?.email) {
          throw new Error("User email is missing");
        }

        const response = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/api/v1/profile`, {
          method: "GET",
          headers: {
            "Content-Type": "application/json",
            "X-User-Email": user.email,
          },
        });

        if (!response.ok) {
          throw new Error("Failed to fetch profile");
        }

        const data = await response.json();
        setProfile((prevProfile) => ({
          ...prevProfile,
          name: data.name || "",
          email: data.email || user.email,
        }));
      } catch (error) {
        setError("Error fetching profile. Please try again.");
        console.error(error);
      }
    };

    if (user?.email) {
      fetchProfile();
    }
  }, [user?.email]);

  // Handle input changes
  const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setProfile((prevProfile) => ({
      ...prevProfile,
      [name]: value,
    }));
  };

  // Handle file input changes
  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const file = e.target.files ? e.target.files[0] : null;
    setProfile((prevProfile) => ({
      ...prevProfile,
      user_avatar: file, // Assign the file object
    }));
  };

  // Handle form submission to update the profile
  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();

    const formData = new FormData();
    formData.append("applicant_user[name]", profile.name);
    formData.append("applicant_user[email]", profile.email);

    if (profile.user_avatar) {
      formData.append("applicant_user[user_avatar]", profile.user_avatar); // Append the file
    }

    try {
      const response = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/api/v1/profile`, {
        method: "PUT",
        headers: {
          "X-User-Email": profile.email, // Email header
        },
        body: formData, // Pass FormData as the body
      });

      if (!response.ok) {
        throw new Error("Failed to update profile");
      }

      const data = await response.json();
      setMessage("Profile updated successfully!");
      // console.log("Updated profile:", data);
      router.push(`/profile`)
    } catch (error) {
      setError("Error updating profile. Please try again.");
      console.error(error);
    }
  };

  return (
    <Box component="section" sx={{ p: 2, }}>
       
      <h1>Edit Profile</h1>
      {message && <p style={{ color: "green" }}>{message}</p>}
      {error && <p style={{ color: "red" }}>{error}</p>}

      <form onSubmit={handleSubmit}>
      <Stack direction="row" spacing={2}>
        <TextField
          
          label="Email"
          name="email"
          value={profile.email}
          type="email"
          disabled
          sx={{ mb: 1 }}
           size="small"
        />

        <TextField
          
          label="Name"
          name="name"
          value={profile.name}
          onChange={handleChange}
          sx={{ mb: 1 }}
           size="small"
          required
        />

        <Button variant="outlined" component="label" sx={{ mb: 1 }}>
          Upload Photo
          <input
            name="user_avatar"
            type="file"
            hidden
            accept=".png, .jpg, .jpeg"
            onChange={handleFileChange} // Handle file change here
            
          />
        </Button>
        </Stack>
<br />
        <Button variant="contained" type="submit" color="success">
          Update Profile
        </Button>
       
      </form>
      
    </Box>
  );
};

export default EditProfile;
