      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Kazuate-Game.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
        01 INPUT-RECORD.
         03 IN-DATA PIC 9(3).
         03 Ans PIC 9(3).
         03 FLAG1 PIC 9(1).
         03 Rand-Seed PIC 9(4).
         01 TIME-AND-DATE.
          05 TIME-AND-DATE-TYPE.
            10 TIME-DATE.
               15 TIME-YEAR  PIC  9(4).
               15 TIME-MONTH PIC  9(2).
               15 TIME-DAY   PIC  9(2).
            10 TIME-TIME.
               15 TIME-HOUR  PIC  9(2).
               15 TIME-MIN   PIC  9(2).
               15 TIME-SEC   PIC  9(2).
              15 TIME-MS    PIC  9(2).
            10 TIME-DIFF-GMT         PIC S9(4).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

            MOVE FUNCTION CURRENT-DATE to TIME-AND-DATE.
            COMPUTE Rand-Seed = 100*TIME-SEC+TIME-MS.
            COMPUTE Ans = FUNCTION RANDOM(Rand-Seed)*100000.
            COMPUTE Ans = FUNCTION MOD(Ans,101).
            COMPUTE FLAG1 = 0.

            DISPLAY "The correct answer is between 0 and 100.".
            DISPLAY "Try to guess.".

            PERFORM UNTIL FLAG1 = 1
                ACCEPT IN-DATA FROM CONSOLE
                IF ANS<IN-DATA
                    DISPLAY "It is smaller than " IN-DATA
                ELSE
                    IF ANS>IN-DATA
                        DISPLAY "It is bigger than " IN-DATA
                    ELSE
                        DISPLAY "Correct!" IN-DATA
                        COMPUTE FLAG1 = 1
                    END-IF
                END-IF
            END-PERFORM.
            STOP RUN.
       END PROGRAM Kazuate-Game.
