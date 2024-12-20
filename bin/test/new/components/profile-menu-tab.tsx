"use client";

import * as React from 'react';
import Box from '@mui/material/Box';
import Tab from '@mui/material/Tab';
import TabContext from '@mui/lab/TabContext';
import TabList from '@mui/lab/TabList';
import TabPanel from '@mui/lab/TabPanel';
import Profile from '@/app/profile/profile';
import MyApplication from '@/app/my_application/page';

import JobLists from './jobs/job-lists';

export default function ProfileMenuTabs() {
  const [value, setValue] = React.useState('1');

  const handleChange = (event: React.SyntheticEvent, newValue: string) => {
    setValue(newValue);
  };

  return (
    <section>
      <div className="mx-auto mt-2 max-w-6xl px-4 sm:px-6">
        <div
          className="relative overflow-hidden rounded-2xl  shadow-xl before:pointer-events-none before:absolute before:inset-0 before:-z-10 before:rounded-2xl "
          data-aos="zoom-y-out"
        >
          <TabContext value={value}>
            <Box sx={{ borderBottom: 1, borderColor: 'divider' }}>
              <TabList onChange={handleChange} aria-label="lab API tabs example">
                <Tab label="My Profile" value="1" />
                <Tab label="My Application" value="2" />
                <Tab label="Announcement" value="3" />
              </TabList>
            </Box>
            <TabPanel value="1">
            <Profile />
            </TabPanel>
            <TabPanel value="2">
              <MyApplication />
            </TabPanel>
            <TabPanel value="3">Item Three</TabPanel>
          </TabContext>
         
          
        
        </div>
      </div>
    </section>
   
      
   
  );
}
