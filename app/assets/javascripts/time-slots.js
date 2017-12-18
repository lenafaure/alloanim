
function french_holidays() {

    var holidays_array = [];
    var holidays_records = OfficialHolidays.records;

    for (var i = 0; i < holidays_records.length; i++) {
        if (holidays_records[i].fields.DESCRIPTION !== "Rentrée scolaire des élèves" && holidays_records[i].fields.DESCRIPTION !== "Vacances d'été" ) {
            holidays_array.push([holidays_records[i].fields.DTSTART, holidays_records[i].fields.DTEND])
        }
    }

    return holidays_array;
}

function is_holiday(day) {

    var holidays_array = french_holidays();
    var start_date;
    var end_date;

    for (var i = 0; i < holidays_array.length; i++) {
        start_date = holidays_array[i][0];
        end_date = holidays_array[i][1];
        if (day.isBetween(start_date, end_date)) {
            return true;
        }
    }
}

var TimeSlots = [
    {   weekday: 1,
        slots:
            [
                "Interclasse",
                "Goûter / Etude"
            ],
        holiday: false
    },
    {
        weekday: 2,
        slots:
            [
                "Interclasse",
                "TAP",
                "Goûter / Etude"
            ],
        holiday: false
    },
    {
        weekday: 3,
        slots:
            [
                "Interclasse",
                "Centre de Loisirs"
            ],
        holiday: false
    },
    {   weekday: 4,
        slots:
            [
                "Interclasse",
                "Goûter / Etude"
            ],
        holiday: false
    },
    {
        weekday: 5,
        slots:
            [
                "Interclasse",
                "TAP",
                "Goûter / Etude"
            ],
        holiday: false
    },
    {   weekday: 1,
        slots:
            [
                "Centre de Loisirs"
            ],
        holiday: true
    },
    {
        weekday: 2,
        slots:
            [
                "Centre de Loisirs"
            ],
        holiday: true
    },
    {
        weekday: 3,
        slots:
            [
                "Centre de Loisirs"
            ],
        holiday: true
    },
    {   weekday: 4,
        slots:
            [
                "Centre de Loisirs"
            ],
        holiday: true
    },
    {
        weekday: 5,
        slots:
            [
                "Centre de Loisirs"
            ],
        holiday: true
    }
];
