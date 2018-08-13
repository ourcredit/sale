const URL: string =
  process.env.NODE_ENV === "production"
    ? "http://103.45.8.198:8081/"
    : "http://103.45.8.198:8081/";
export default URL;
