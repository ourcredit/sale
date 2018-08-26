const URL: string =
  process.env.NODE_ENV === "production"
    ? "https://service.leftins.com/"
    : "https://service.leftins.com/";
export default URL;
