import { useEffect, useState } from "react";
import SearchBar from "./search-bar";
import Link from "next/link"; 

export default function HeroUserLogin() {
  const [profileName, setProfileName] = useState<string>("");
  const [name, setName] = useState("");

  useEffect(() => {
    const storedProfile = localStorage.getItem("userProfile");
    if (storedProfile) {
      const profileName = JSON.parse(storedProfile);
      setName(profileName.name)
    }
  }, []);


  return (
    <>
      <section className="py-20 bg-blue-200">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 ">
          <div className="lg:grid lg:grid-cols-12 lg:gap-8 bg-blue-200">
            <div className="sm:text-center md:max-w-2xl md:mx-auto lg:col-span-6 lg:text-left ">
              <h1 className="text-4xl font-bold text-gray-900 tracking-tight sm:text-5xl md:text-4xl ">
                Welcome
                <span className="block text-blue-900">
                    {name ? (
                         name
                      ) : (
                        <>
                         Guest {" "}<br />
                         
                             Please update your profile
                     
                         
                        </>
                      )}
                </span>
              </h1>
            </div>
            <div className="mt-12 relative sm:max-w-lg sm:mx-auto lg:mt-0 lg:max-w-none lg:mx-0 lg:col-span-6 lg:flex lg:items-center bg-gray-100 rounded-full">
             
            </div>
          </div>
        </div>
      </section>
    </>
  );
}
