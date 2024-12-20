'use client';

import { useState, useEffect } from 'react';
import { Copy, Check } from 'lucide-react';

export function Terminal() {
  const [terminalStep, setTerminalStep] = useState(0);
  const [copied, setCopied] = useState(false);
  const terminalSteps = [
    'Create your account',
    'Verify your account in your email',
    'Sign-in to the portal',
    'Search for available jobs',
    'Submit require documents',
    'Response to selection criteria',
  ];

  useEffect(() => {
    const timer = setTimeout(() => {
      setTerminalStep((prev) =>
        prev < terminalSteps.length - 1 ? prev + 1 : prev
      );
    }, 500);

    return () => clearTimeout(timer);
  }, [terminalStep]);

  const copyToClipboard = () => {
    navigator.clipboard.writeText(terminalSteps.join('\n'));
    setCopied(true);
    setTimeout(() => setCopied(false), 2000);
  };

  return (
    <div className="w-full rounded-lg shadow-lg overflow-hidden bg-gray-900 text-white font-sans text-base relative">
      <div className="p-4">
        <div className="flex justify-between items-center mb-4">
          <div className="flex space-x-2">
          <h6>How to apply jobs:</h6>
            {/* <div className="w-3 h-3 rounded-full bg-red-500"></div>
            <div className="w-3 h-3 rounded-full bg-yellow-500"></div>
            <div className="w-3 h-3 rounded-full bg-green-500"></div> */}
          </div>
          
        </div>
       
        <div className="space-y-2">
          
          {terminalSteps.map((step, index) => (
            <div
              key={index}
              className={`${index > terminalStep ? 'opacity-0' : 'opacity-100'} transition-opacity duration-300`}
            >
              <span className="text-green-400">* </span> {step}
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}