rem   *** validation ***
call scripts\run-validator-tests.bat
call scripts\run-checker-tests.bat

rem    *** tests ***
md tests
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 3 --max-n 6 --min-n 2 --max-val 10" "tests\02" 2
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 18 --max-n 8 --min-n 3 --max-val 16" "tests\03" 3
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 20 --max-n 5 --min-n 2 --max-val 8" "tests\04" 4
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 20 --max-n 5 --min-n 2 --max-val 28" "tests\05" 5
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 13 --max-n 11 --min-n 8 --max-val 48" "tests\06" 6
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 13 --max-n 11 --min-n 8 --max-val 68" "tests\07" 7
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 13 --max-n 11 --min-n 8 --max-val 88" "tests\08" 8
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 13 --max-n 11 --min-n 8 --max-val 108" "tests\09" 9
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 13 --max-n 11 --min-n 8 --max-val 10" "tests\10" 10
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 5 --max-n 30 --min-n 28 --max-val 10" "tests\11" 11
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 5 --max-n 30 --min-n 28 --max-val 40" "tests\12" 12
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 5 --max-n 30 --min-n 28 --max-val 70" "tests\13" 13
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 5 --max-n 30 --min-n 28 --max-val 170" "tests\14" 14
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 8 --max-n 8 --min-n 3 --max-val 108" "tests\15" 15
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 8 --max-n 8 --min-n 3 --max-val 16" "tests\16" 16
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 8 --max-n 8 --min-n 3 --max-val 500 --min-val 20" "tests\17" 17
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 15 --max-n 10 --max-val 1000000" "tests\18" 18
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 20 --min-n 3 --max-n 3 --max-val 8" "tests\19" 19
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 6 --min-n 4 --max-n 5 --max-val 30" "tests\20" 20
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 5 --min-n 8 --max-n 10 --max-val 1000" "tests\21" 21
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 5 --min-n 9 --max-n 12 --max-val 2000" "tests\22" 22
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 4 --min-n 12 --max-n 14 --max-val 10000" "tests\23" 23
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 4 --min-n 24 --max-n 25 --max-val 100000" "tests\24" 24
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 2 --min-n 38 --max-n 41 --max-val 1000000" "tests\25" 25
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 2 --min-n 69 --max-n 69 --max-val 5000000" "tests\26" 26
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 69 --max-n 69 --max-val 1" "tests\27" 27
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 2 --min-n 69 --max-n 69 --max-val 11" "tests\28" 28
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 2 --min-n 70 --max-n 70 --max-val 111" "tests\29" 29
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 81 --max-n 82 --max-val 10000000" "tests\30" 30
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 91 --max-n 97 --max-val 100000000" "tests\31" 31
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 99 --max-n 99 --max-val 100000000" "tests\32" 32
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 99 --max-n 99 --max-val 100" "tests\33" 33
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 99 --max-n 99 --max-val 6000" "tests\34" 34
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 100 --max-n 100 --max-val 100000000" "tests\35" 35
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 100 --max-n 100 --max-val 400" "tests\36" 36
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 100 --max-n 100 --max-val 30000" "tests\37" 37
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 4 --min-n 12 --max-n 26 --max-val 69696969" "tests\38" 38
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 4 --min-n 12 --max-n 14 --max-val 68" "tests\39" 39
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 100 --max-n 150 --max-val 300000" "tests\40" 40
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 300" "tests\41" 41
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 20" "tests\42" 42
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 2" "tests\43" 43
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 34934398" "tests\44" 44
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 999999999" "tests\45" 45
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 3493439" "tests\46" 46
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 349343" "tests\47" 47
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 349344" "tests\48" 48
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 349345" "tests\49" 49
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 34934" "tests\50" 50
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 4" "tests\51" 51
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 8" "tests\52" 52
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 10" "tests\53" 53
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 16" "tests\54" 54
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 60" "tests\55" 55
call scripts\gen-input-via-stdout.bat "files\gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 120" "tests\56" 56
call scripts\gen-input-via-stdout.bat "files\genShuffle.exe --tests 10 --min-n 3 --max-n 15" "tests\57" 57
call scripts\gen-input-via-stdout.bat "files\genShuffle.exe --tests 12 --min-n 10 --max-n 12" "tests\58" 58
call scripts\gen-input-via-stdout.bat "files\genShuffle.exe --tests 7 --min-n 15 --max-n 21" "tests\59" 59
call scripts\gen-input-via-stdout.bat "files\genShuffle.exe --tests 3 --min-n 30 --max-n 40" "tests\60" 60
call scripts\gen-input-via-stdout.bat "files\genShuffle.exe --tests 3 --min-n 50 --max-n 50" "tests\61" 61
call scripts\gen-input-via-stdout.bat "files\genShuffle.exe --tests 2 --min-n 75 --max-n 75" "tests\62" 62
call scripts\gen-input-via-stdout.bat "files\genShuffle.exe --tests 1 --min-n 100 --max-n 100" "tests\63" 63
call scripts\gen-input-via-stdout.bat "files\genShuffle.exe --tests 1 --min-n 120 --max-n 120" "tests\64" 64
call scripts\gen-input-via-stdout.bat "files\genShuffle.exe --tests 1 --min-n 150 --max-n 150" "tests\65" 65
call scripts\gen-answer.bat tests\01 tests\01.a "tests" ""
call scripts\gen-answer.bat tests\02 tests\02.a "tests" ""
call scripts\gen-answer.bat tests\03 tests\03.a "tests" ""
call scripts\gen-answer.bat tests\04 tests\04.a "tests" ""
call scripts\gen-answer.bat tests\05 tests\05.a "tests" ""
call scripts\gen-answer.bat tests\06 tests\06.a "tests" ""
call scripts\gen-answer.bat tests\07 tests\07.a "tests" ""
call scripts\gen-answer.bat tests\08 tests\08.a "tests" ""
call scripts\gen-answer.bat tests\09 tests\09.a "tests" ""
call scripts\gen-answer.bat tests\10 tests\10.a "tests" ""
call scripts\gen-answer.bat tests\11 tests\11.a "tests" ""
call scripts\gen-answer.bat tests\12 tests\12.a "tests" ""
call scripts\gen-answer.bat tests\13 tests\13.a "tests" ""
call scripts\gen-answer.bat tests\14 tests\14.a "tests" ""
call scripts\gen-answer.bat tests\15 tests\15.a "tests" ""
call scripts\gen-answer.bat tests\16 tests\16.a "tests" ""
call scripts\gen-answer.bat tests\17 tests\17.a "tests" ""
call scripts\gen-answer.bat tests\18 tests\18.a "tests" ""
call scripts\gen-answer.bat tests\19 tests\19.a "tests" ""
call scripts\gen-answer.bat tests\20 tests\20.a "tests" ""
call scripts\gen-answer.bat tests\21 tests\21.a "tests" ""
call scripts\gen-answer.bat tests\22 tests\22.a "tests" ""
call scripts\gen-answer.bat tests\23 tests\23.a "tests" ""
call scripts\gen-answer.bat tests\24 tests\24.a "tests" ""
call scripts\gen-answer.bat tests\25 tests\25.a "tests" ""
call scripts\gen-answer.bat tests\26 tests\26.a "tests" ""
call scripts\gen-answer.bat tests\27 tests\27.a "tests" ""
call scripts\gen-answer.bat tests\28 tests\28.a "tests" ""
call scripts\gen-answer.bat tests\29 tests\29.a "tests" ""
call scripts\gen-answer.bat tests\30 tests\30.a "tests" ""
call scripts\gen-answer.bat tests\31 tests\31.a "tests" ""
call scripts\gen-answer.bat tests\32 tests\32.a "tests" ""
call scripts\gen-answer.bat tests\33 tests\33.a "tests" ""
call scripts\gen-answer.bat tests\34 tests\34.a "tests" ""
call scripts\gen-answer.bat tests\35 tests\35.a "tests" ""
call scripts\gen-answer.bat tests\36 tests\36.a "tests" ""
call scripts\gen-answer.bat tests\37 tests\37.a "tests" ""
call scripts\gen-answer.bat tests\38 tests\38.a "tests" ""
call scripts\gen-answer.bat tests\39 tests\39.a "tests" ""
call scripts\gen-answer.bat tests\40 tests\40.a "tests" ""
call scripts\gen-answer.bat tests\41 tests\41.a "tests" ""
call scripts\gen-answer.bat tests\42 tests\42.a "tests" ""
call scripts\gen-answer.bat tests\43 tests\43.a "tests" ""
call scripts\gen-answer.bat tests\44 tests\44.a "tests" ""
call scripts\gen-answer.bat tests\45 tests\45.a "tests" ""
call scripts\gen-answer.bat tests\46 tests\46.a "tests" ""
call scripts\gen-answer.bat tests\47 tests\47.a "tests" ""
call scripts\gen-answer.bat tests\48 tests\48.a "tests" ""
call scripts\gen-answer.bat tests\49 tests\49.a "tests" ""
call scripts\gen-answer.bat tests\50 tests\50.a "tests" ""
call scripts\gen-answer.bat tests\51 tests\51.a "tests" ""
call scripts\gen-answer.bat tests\52 tests\52.a "tests" ""
call scripts\gen-answer.bat tests\53 tests\53.a "tests" ""
call scripts\gen-answer.bat tests\54 tests\54.a "tests" ""
call scripts\gen-answer.bat tests\55 tests\55.a "tests" ""
call scripts\gen-answer.bat tests\56 tests\56.a "tests" ""
call scripts\gen-answer.bat tests\57 tests\57.a "tests" ""
call scripts\gen-answer.bat tests\58 tests\58.a "tests" ""
call scripts\gen-answer.bat tests\59 tests\59.a "tests" ""
call scripts\gen-answer.bat tests\60 tests\60.a "tests" ""
call scripts\gen-answer.bat tests\61 tests\61.a "tests" ""
call scripts\gen-answer.bat tests\62 tests\62.a "tests" ""
call scripts\gen-answer.bat tests\63 tests\63.a "tests" ""
call scripts\gen-answer.bat tests\64 tests\64.a "tests" ""
call scripts\gen-answer.bat tests\65 tests\65.a "tests" ""

