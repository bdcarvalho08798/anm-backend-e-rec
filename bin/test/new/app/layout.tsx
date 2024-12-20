import "./css/style.css";

import { AuthProvider } from "@/context/AuthContext";

export const metadata = {
  title: "ANM - E-recruitment portal",
  description: "ANM - E-recruitment portal",
};

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  return (
    <html lang="en" className="scroll-smooth">
      <body
        className={` bg-gray-50 font-inter tracking-tight text-gray-900 antialiased`}
      >
        <div className="flex min-h-screen flex-col overflow-hidden supports-[overflow:clip]:overflow-clip">
        <AuthProvider> {children}</AuthProvider> 
        </div>
      </body>
    </html>
  );
}
