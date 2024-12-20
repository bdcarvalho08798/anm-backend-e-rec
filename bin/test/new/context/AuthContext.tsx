"use client";
import { createContext, useContext, useState, useEffect } from "react";

interface User {
  email: string;
  //userid: number;
}

interface AuthContextProps {
  isAuthenticated: boolean;
  user: User | null; // Add user data here
  logout: () => void;
  login: (token: string, userData: User) => void; // Pass user data along with token
}

const AuthContext = createContext<AuthContextProps>({
  isAuthenticated: false,
  user: null,
  logout: () => {},
  login: () => {},
});

export const AuthProvider: React.FC<{ children: React.ReactNode }> = ({ children }) => {
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const [user, setUser] = useState<User | null>(null); // Store user data here

  useEffect(() => {
    const token = localStorage.getItem("token");
    const userData = localStorage.getItem("user");

    if (token) {
      setIsAuthenticated(true);

      if (userData) {
        try {
          const parsedUser = JSON.parse(userData);
          setUser(parsedUser); // Parse and store user data from localStorage
        } catch (error) {
          console.error("Error parsing user data:", error);
        }
      }
    }
  }, []);

  const login = (token: string, userData: User) => {
    localStorage.setItem("token", token);
    localStorage.setItem("user", JSON.stringify(userData)); // Save user data in localStorage
    setIsAuthenticated(true);
    setUser(userData); // Store user data in context
  };

  const logout = () => {
    localStorage.removeItem("token");
    localStorage.removeItem("user");
    localStorage.removeItem("profileName");
    localStorage.removeItem("userid");
    localStorage.removeItem("userProfile");
    localStorage.removeItem("lastActivity");
    setIsAuthenticated(false);
    setUser(null); // Clear user data on logout
  };

  return (
    <AuthContext.Provider value={{ isAuthenticated, user, login, logout }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => useContext(AuthContext);
