/** @type {import('next').NextConfig} */
const nextConfig = {};

module.exports = nextConfig;

module.exports = {
    serverRuntimeConfig: {
        API_URL: process.env.API_URL,
    },
    // Will be available on both server and client
    publicRuntimeConfig: {
        NEXT_PUBLIC_API_URL: process.env.NEXT_PUBLIC_API_URL,
    }
}