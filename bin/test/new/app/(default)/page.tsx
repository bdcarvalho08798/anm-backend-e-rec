"use client";

// export const metadata = {
//   title: "ANM - E-Recruitment Portal",
//   description: "ANM - E-Recruitment Portal",
// };


import Hero from "@/components/hero-home";
import BusinessCategories from "@/components/business-categories";
import FeaturesPlanet from "@/components/features-planet";
import LargeTestimonial from "@/components/large-testimonial";
import Cta from "@/components/cta";
import TopSection from "@/components/top-section";
import Guideline from "@/components/guideline";
import HeroHeader from "@/components/hero-header";
import HeroUserLogin from "@/components/hero-user-login";
import { useAuth } from "@/context/AuthContext";

export default function Home() {
  const { isAuthenticated } = useAuth();
  
  const apiUrl = process.env.NEXT_PUBLIC_API_URL;

  console.log("DOTENV: ", apiUrl);

  return (
    <>
    {!isAuthenticated && (
      <HeroHeader />
    )}

      <TopSection />
      {/* <Guideline /> */}
      {/* <LargeTestimonial /> */}
    </>
  );
}
