import http from "k6/http";
import { sleep, check } from "k6";

export default function () {
  var baseAddress = "http://localhost/juniper";

  var req = {
    arrivalDate: "2021-09-25",
    nights: 7,
    occupancies: [
      {
        roomId: 0,
        providerRoomId: 0,
        adults: 2,
        childAges: [],
        sequenceOrder: 0,
      },
    ],
    regionIds: ["155"],
  };

  var res = http.post(`${baseAddress}/search/region`, JSON.stringify(req), {
    headers: { "Content-Type": "application/json" },
  });

  // console.log(JSON.stringify(res));

  sleep(4);

  check(res, {
    "is status 200": (r) => r.status === 200,
    "is status 204": (r) => r.status === 204,
    "is status 404": (r) => r.status === 404,
    "is status 500": (r) => r.status === 500
  });
}