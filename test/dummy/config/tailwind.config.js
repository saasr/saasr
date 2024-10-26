const defaultTheme = require("tailwindcss/defaultTheme");
const execSync = require("child_process").execSync;
const saasrFiles = execSync("bundle show saasr", { encoding: "utf-8" }).trim();

module.exports = {
  content: [
    "./public/*.html",
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*.{erb,html}",
    saasrFiles + "/app/**/*.{erb,html,js,rb}",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/container-queries"),
  ],
};
