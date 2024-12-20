"use client";

import { useEffect, useState } from "react";
import { useRouter } from "next/navigation";
import { useAuth } from "@/context/AuthContext"; // Assuming the AuthContext is set up
import Box from "@mui/material/Box";
import Card from "@mui/material/Card";
import CardActions from "@mui/material/CardActions";
import CardContent from "@mui/material/CardContent";
import Button from "@mui/material/Button";
import Typography from "@mui/material/Typography";
import Loading from "@/components/loading";
import CardMedia from "@mui/material/CardMedia";
import Grid from "@mui/material/Grid2";

interface UserProfile {
  id: number;
  name: string;
  email: string;
  user_avatar: string | { url: string } | null;
}

const Profile = () => {
  const { isAuthenticated, user } = useAuth(); // Assuming user data is in AuthContext
  const [profile, setProfile] = useState<UserProfile | null>(null);
  const [error, setError] = useState<string | null>(null);
  const router = useRouter();

  useEffect(() => {
    if (!isAuthenticated || !user) {
      router.push("/signin");
    } else {
      fetchUserProfile();
    }
  }, [isAuthenticated, user, router]);

  const fetchUserProfile = async () => {
    if (!user?.email) {
      setError("Email is missing.");
      return;
    }

    try {
      const response = await fetch(`${process.env.NEXT_PUBLIC_API_URL}/api/v1/profile`, {
        method: "GET",
        headers: {
          "X-User-Email": user.email, // Send the email in the header
        },
      });

      if (!response.ok) {
        throw new Error("Failed to fetch profile");
      }

      const userData: UserProfile = await response.json();
      setProfile(userData); // Set the profile data
      saveProfileToLocalStorage(userData); // Save profile to localStorage
    } catch (error) {
      console.error("Error fetching profile:", error);
      setError("An error occurred while fetching the profile.");
    }
  };

  const saveProfileToLocalStorage = (profileData: UserProfile) => {
    localStorage.setItem("userProfile", JSON.stringify(profileData));
  };

  if (error) {
    return <div>{error}</div>;
  }

  if (!profile) {
    return (
      <div>
        <Loading />
      </div>
    ); // Show loading state while fetching user data
  }

  const avatarUrl =
    profile.user_avatar && typeof profile.user_avatar === "object" && "url" in profile.user_avatar
      ? `${process.env.NEXT_PUBLIC_API_URL}${profile.user_avatar.url}`
      : profile.user_avatar
      ? `${process.env.NEXT_PUBLIC_API_URL}/${profile.user_avatar}`
      : "/images/anm_timor_leste_logo.jpeg"; // Default image

  return (
    <div style={{ alignContent: "center" }}>
      <Grid container spacing={0.5} alignItems="center">
        <CardContent>
          <CardMedia
            component="img"
            alt={profile.name || "User Avatar"}
            sx={{ width: 70, height: 70, borderRadius: "50%" }}
            image={avatarUrl}
          />
        </CardContent>
        <Box sx={{ flex: 1 }}>
          <CardContent>
            <Typography variant="h6">{profile.name || "Your name"}</Typography>
            <Typography variant="body2" sx={{ color: "" }}>
              {profile.email || "Your email"}
            </Typography>
          </CardContent>
        </Box>
      </Grid>
      <CardActions sx={{ justifyContent: "flex-end" }}>
        <Button size="small" onClick={() => router.push(`/profile/update`)}>
          Update Profile
        </Button>
        <Button size="small" onClick={() => router.push(`/profile/change-password`)}>
          Change Password
        </Button>
      </CardActions>
    </div>
  );
};

export default Profile;
