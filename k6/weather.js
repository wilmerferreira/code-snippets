import http from 'k6/http';

export default function () {
  http.get('https://localhost:5001/weatherforecast');
}