module.exports = {
    apps: [
      {
        name: "anm-rec-test",
        script: "./node_modules/.bin/next", // Adjust this based on your app's entry point
        args: "start", // or any other start command
        env: {
          NODE_ENV: "production",
          HOST: "192.168.4.128",
          PORT: 4000,
        },
      },
    ],
  };
  