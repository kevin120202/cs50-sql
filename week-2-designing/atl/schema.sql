CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "check_ins" (
    "id" INTEGER,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "flight_id" INTEGER NOT NULL,
    "passenger_id" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id"),
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    PRIMARY KEY("id")
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "flight_number" INTEGER NOT NULL,
    "airline_id" INTEGER NOT NULL,
    "airport_departed" TEXT NOT NULL,
    "airport_destination" TEXT NOT NULL,
    "departure_time" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expected_arrival" NUMERIC NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
)

INSERT INTO "passengers" ("first_name", "last_name", "age")
VALUES ('Amelia', 'Earhart', 39);

INSERT INTO "airlines" ("name", "concourse")
VALUES ('Delta', 'B');

INSERT INTO "flights" ("flight_number", "airline_id", "airport_departed", "airport_destination", "departure_time", "expected_arrival")
VALUES (300, 1, 'ATL', 'BOS', '2023-08-03 18:46:00', '2023-08-03 21:09:00');

INSERT INTO "check_ins" ("datetime", "flight_id", "passenger_id")
VALUES ('2023-08-03 15:03:00', 1, 1);