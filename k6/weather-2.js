import http from 'k6/http'
import { sleep } from 'k6'

export const options = {
  batch: 5,
  stages: [
    { duration: '5s', target: 5 },
    { duration: '5s', target: 10 },
    { duration: '5s', target: 20 },
    { duration: '15s', target: 0 },
  ],
  thresholds: {
    http_req_duration: ['p(99)<1500'], // 99% of requests must complete below 1.5s
  },
}

export default function () {
  http.get('https://localhost:5001/weatherforecast')
  sleep(1)
}
