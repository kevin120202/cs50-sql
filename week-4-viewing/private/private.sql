CREATE TABLE "temp" (
    "id" INTEGER,
    "sentence" TEXT NOT NULL,
    PRIMARY KEY("id")
);

CREATE TABLE "phrases" (
    "id" INTEGER,
    "phrase" TEXT NOT NULL,
    PRIMARY KEY("id")
);

INSERT INTO "temp" ("sentence")
SELECT "sentence" FROM "sentences"
WHERE "id" IN (14,114,618,630,932,2230,2346,3041);

INSERT INTO "phrases"("phrase")
SELECT 
    CASE
        WHEN "id" = 1 THEN substr("sentence", 98, 4)
        WHEN "id" = 2 THEN substr("sentence", 3, 5)
        WHEN "id" = 3 THEN substr("sentence", 72, 9)
        WHEN "id" = 4 THEN substr("sentence", 7, 3)
        WHEN "id" = 5 THEN substr("sentence", 12, 5)
        WHEN "id" = 6 THEN substr("sentence", 50, 7)
        WHEN "id" = 7 THEN substr("sentence", 44, 10)
        WHEN "id" = 8 THEN substr("sentence", 14, 5)
    END
FROM "temp";

CREATE VIEW "message" AS
SELECT "phrase" FROM "phrases";

-- SELECT substr(sentence, 98, 4) FROM sentences
-- WHERE id = 14;

-- SELECT substr(sentence, 3, 5) FROM sentences
-- WHERE id = 114;

-- SELECT substr(sentence, 72, 9) FROM sentences
-- WHERE id = 618;

-- SELECT substr(sentence, 7, 3) FROM sentences
-- WHERE id = 630;

-- SELECT substr(sentence, 12, 5) FROM sentences
-- WHERE id = 932;

-- SELECT substr(sentence, 50, 7) FROM sentences
-- WHERE id = 2230;

-- SELECT substr(sentence, 44, 10) FROM sentences
-- WHERE id = 2346;

-- SELECT substr(sentence, 14, 5) FROM sentences
-- WHERE id = 3041;
