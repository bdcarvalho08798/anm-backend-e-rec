import * as React from 'react';
import CircularProgress from '@mui/material/CircularProgress';

export default function Loading() {
  return (
    <section>
        <div className="mx-auto mt-20 max-w-6xl px-4 sm:px-6">
          <div
            className="relative overflow-hidden rounded-2xl text-center shadow-xl before:pointer-events-none before:absolute before:inset-0 before:-z-10 before:rounded-2xl "
            data-aos="zoom-y-out"
          >
                <CircularProgress size="5rem" />
            </div>
        </div>
    </section>
  
  );
}