const URL: string =
  process.env.NODE_ENV === "production"
    ? "https://saleservice.leftins.com/"
    : "http://localhost:8081/";
export default URL;
