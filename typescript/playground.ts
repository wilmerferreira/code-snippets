interface IBankHolidays {
  [country: string]: {
    division: string,
    events: {
      title: string;
      date: string;
      notes: string;
      bunting: boolean;
    }[]
  }
}

let bankHolidays: IBankHolidays = {
  "england-and-wales": {
    "division": "england-and-wales",
    "events": [
      {
        "title": "New Year’s Day",
        "date": "2016-01-01",
        "notes": "",
        "bunting": true
      },
      {
        "title": "Good Friday",
        "date": "2016-03-25",
        "notes": "",
        "bunting": false
      },
      {
        "title": "Easter Monday",
        "date": "2016-03-28",
        "notes": "",
        "bunting": true
      },
      {
        "title": "Early May bank holiday",
        "date": "2016-05-02",
        "notes": "",
        "bunting": true
      }
    ]
  }
};

console.log(bankHolidays);

let json = JSON.stringify(bankHolidays);

console.log(json);