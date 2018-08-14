const URL: string =
  process.env.NODE_ENV === "production"
    ? "https://service.leftins.com/"
    : "http://localhost:8081/";
export default URL;
