import axios from "axios";

export default axios.create({
  baseURL: "http://52.74.146.23:4000/api",
  headers: {
    "Content-type": "application/json"
  }
});
