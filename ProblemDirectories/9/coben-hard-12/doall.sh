#!/usr/bin/env bash
#   *** validation ***
scripts/run-validator-tests.sh
scripts/run-checker-tests.sh

#    *** tests ***
mkdir -p tests
echo "Generating test #2"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 3 --max-n 6 --min-n 2 --max-val 10" "tests/02" 2
echo "Generating test #3"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 18 --max-n 8 --min-n 3 --max-val 16" "tests/03" 3
echo "Generating test #4"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 20 --max-n 5 --min-n 2 --max-val 8" "tests/04" 4
echo "Generating test #5"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 20 --max-n 5 --min-n 2 --max-val 28" "tests/05" 5
echo "Generating test #6"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 13 --max-n 11 --min-n 8 --max-val 48" "tests/06" 6
echo "Generating test #7"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 13 --max-n 11 --min-n 8 --max-val 68" "tests/07" 7
echo "Generating test #8"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 13 --max-n 11 --min-n 8 --max-val 88" "tests/08" 8
echo "Generating test #9"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 13 --max-n 11 --min-n 8 --max-val 108" "tests/09" 9
echo "Generating test #10"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 13 --max-n 11 --min-n 8 --max-val 10" "tests/10" 10
echo "Generating test #11"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 5 --max-n 30 --min-n 28 --max-val 10" "tests/11" 11
echo "Generating test #12"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 5 --max-n 30 --min-n 28 --max-val 40" "tests/12" 12
echo "Generating test #13"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 5 --max-n 30 --min-n 28 --max-val 70" "tests/13" 13
echo "Generating test #14"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 5 --max-n 30 --min-n 28 --max-val 170" "tests/14" 14
echo "Generating test #15"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 8 --max-n 8 --min-n 3 --max-val 108" "tests/15" 15
echo "Generating test #16"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 8 --max-n 8 --min-n 3 --max-val 16" "tests/16" 16
echo "Generating test #17"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 8 --max-n 8 --min-n 3 --max-val 500 --min-val 20" "tests/17" 17
echo "Generating test #18"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 15 --max-n 10 --max-val 1000000" "tests/18" 18
echo "Generating test #19"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 20 --min-n 3 --max-n 3 --max-val 8" "tests/19" 19
echo "Generating test #20"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 6 --min-n 4 --max-n 5 --max-val 30" "tests/20" 20
echo "Generating test #21"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 5 --min-n 8 --max-n 10 --max-val 1000" "tests/21" 21
echo "Generating test #22"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 5 --min-n 9 --max-n 12 --max-val 2000" "tests/22" 22
echo "Generating test #23"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 4 --min-n 12 --max-n 14 --max-val 10000" "tests/23" 23
echo "Generating test #24"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 4 --min-n 24 --max-n 25 --max-val 100000" "tests/24" 24
echo "Generating test #25"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 2 --min-n 38 --max-n 41 --max-val 1000000" "tests/25" 25
echo "Generating test #26"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 2 --min-n 69 --max-n 69 --max-val 5000000" "tests/26" 26
echo "Generating test #27"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 69 --max-n 69 --max-val 1" "tests/27" 27
echo "Generating test #28"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 2 --min-n 69 --max-n 69 --max-val 11" "tests/28" 28
echo "Generating test #29"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 2 --min-n 70 --max-n 70 --max-val 111" "tests/29" 29
echo "Generating test #30"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 81 --max-n 82 --max-val 10000000" "tests/30" 30
echo "Generating test #31"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 91 --max-n 97 --max-val 100000000" "tests/31" 31
echo "Generating test #32"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 99 --max-n 99 --max-val 100000000" "tests/32" 32
echo "Generating test #33"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 99 --max-n 99 --max-val 100" "tests/33" 33
echo "Generating test #34"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 99 --max-n 99 --max-val 6000" "tests/34" 34
echo "Generating test #35"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 100 --max-n 100 --max-val 100000000" "tests/35" 35
echo "Generating test #36"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 100 --max-n 100 --max-val 400" "tests/36" 36
echo "Generating test #37"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 100 --max-n 100 --max-val 30000" "tests/37" 37
echo "Generating test #38"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 4 --min-n 12 --max-n 26 --max-val 69696969" "tests/38" 38
echo "Generating test #39"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 4 --min-n 12 --max-n 14 --max-val 68" "tests/39" 39
echo "Generating test #40"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 100 --max-n 150 --max-val 300000" "tests/40" 40
echo "Generating test #41"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 300" "tests/41" 41
echo "Generating test #42"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 20" "tests/42" 42
echo "Generating test #43"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 2" "tests/43" 43
echo "Generating test #44"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 34934398" "tests/44" 44
echo "Generating test #45"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 999999999" "tests/45" 45
echo "Generating test #46"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 3493439" "tests/46" 46
echo "Generating test #47"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 349343" "tests/47" 47
echo "Generating test #48"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 349344" "tests/48" 48
echo "Generating test #49"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 349345" "tests/49" 49
echo "Generating test #50"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 34934" "tests/50" 50
echo "Generating test #51"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 4" "tests/51" 51
echo "Generating test #52"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 8" "tests/52" 52
echo "Generating test #53"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 10" "tests/53" 53
echo "Generating test #54"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 16" "tests/54" 54
echo "Generating test #55"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 60" "tests/55" 55
echo "Generating test #56"
scripts/gen-input-via-stdout.sh "wine files/gen.exe --tests 1 --min-n 150 --max-n 150 --max-val 120" "tests/56" 56
echo "Generating test #57"
scripts/gen-input-via-stdout.sh "wine files/genShuffle.exe --tests 10 --min-n 3 --max-n 15" "tests/57" 57
echo "Generating test #58"
scripts/gen-input-via-stdout.sh "wine files/genShuffle.exe --tests 12 --min-n 10 --max-n 12" "tests/58" 58
echo "Generating test #59"
scripts/gen-input-via-stdout.sh "wine files/genShuffle.exe --tests 7 --min-n 15 --max-n 21" "tests/59" 59
echo "Generating test #60"
scripts/gen-input-via-stdout.sh "wine files/genShuffle.exe --tests 3 --min-n 30 --max-n 40" "tests/60" 60
echo "Generating test #61"
scripts/gen-input-via-stdout.sh "wine files/genShuffle.exe --tests 3 --min-n 50 --max-n 50" "tests/61" 61
echo "Generating test #62"
scripts/gen-input-via-stdout.sh "wine files/genShuffle.exe --tests 2 --min-n 75 --max-n 75" "tests/62" 62
echo "Generating test #63"
scripts/gen-input-via-stdout.sh "wine files/genShuffle.exe --tests 1 --min-n 100 --max-n 100" "tests/63" 63
echo "Generating test #64"
scripts/gen-input-via-stdout.sh "wine files/genShuffle.exe --tests 1 --min-n 120 --max-n 120" "tests/64" 64
echo "Generating test #65"
scripts/gen-input-via-stdout.sh "wine files/genShuffle.exe --tests 1 --min-n 150 --max-n 150" "tests/65" 65
echo ""
echo "Generating answer for test #1"
scripts/gen-answer.sh tests/01 tests/01.a "tests" ""
echo ""
echo "Generating answer for test #2"
scripts/gen-answer.sh tests/02 tests/02.a "tests" ""
echo ""
echo "Generating answer for test #3"
scripts/gen-answer.sh tests/03 tests/03.a "tests" ""
echo ""
echo "Generating answer for test #4"
scripts/gen-answer.sh tests/04 tests/04.a "tests" ""
echo ""
echo "Generating answer for test #5"
scripts/gen-answer.sh tests/05 tests/05.a "tests" ""
echo ""
echo "Generating answer for test #6"
scripts/gen-answer.sh tests/06 tests/06.a "tests" ""
echo ""
echo "Generating answer for test #7"
scripts/gen-answer.sh tests/07 tests/07.a "tests" ""
echo ""
echo "Generating answer for test #8"
scripts/gen-answer.sh tests/08 tests/08.a "tests" ""
echo ""
echo "Generating answer for test #9"
scripts/gen-answer.sh tests/09 tests/09.a "tests" ""
echo ""
echo "Generating answer for test #10"
scripts/gen-answer.sh tests/10 tests/10.a "tests" ""
echo ""
echo "Generating answer for test #11"
scripts/gen-answer.sh tests/11 tests/11.a "tests" ""
echo ""
echo "Generating answer for test #12"
scripts/gen-answer.sh tests/12 tests/12.a "tests" ""
echo ""
echo "Generating answer for test #13"
scripts/gen-answer.sh tests/13 tests/13.a "tests" ""
echo ""
echo "Generating answer for test #14"
scripts/gen-answer.sh tests/14 tests/14.a "tests" ""
echo ""
echo "Generating answer for test #15"
scripts/gen-answer.sh tests/15 tests/15.a "tests" ""
echo ""
echo "Generating answer for test #16"
scripts/gen-answer.sh tests/16 tests/16.a "tests" ""
echo ""
echo "Generating answer for test #17"
scripts/gen-answer.sh tests/17 tests/17.a "tests" ""
echo ""
echo "Generating answer for test #18"
scripts/gen-answer.sh tests/18 tests/18.a "tests" ""
echo ""
echo "Generating answer for test #19"
scripts/gen-answer.sh tests/19 tests/19.a "tests" ""
echo ""
echo "Generating answer for test #20"
scripts/gen-answer.sh tests/20 tests/20.a "tests" ""
echo ""
echo "Generating answer for test #21"
scripts/gen-answer.sh tests/21 tests/21.a "tests" ""
echo ""
echo "Generating answer for test #22"
scripts/gen-answer.sh tests/22 tests/22.a "tests" ""
echo ""
echo "Generating answer for test #23"
scripts/gen-answer.sh tests/23 tests/23.a "tests" ""
echo ""
echo "Generating answer for test #24"
scripts/gen-answer.sh tests/24 tests/24.a "tests" ""
echo ""
echo "Generating answer for test #25"
scripts/gen-answer.sh tests/25 tests/25.a "tests" ""
echo ""
echo "Generating answer for test #26"
scripts/gen-answer.sh tests/26 tests/26.a "tests" ""
echo ""
echo "Generating answer for test #27"
scripts/gen-answer.sh tests/27 tests/27.a "tests" ""
echo ""
echo "Generating answer for test #28"
scripts/gen-answer.sh tests/28 tests/28.a "tests" ""
echo ""
echo "Generating answer for test #29"
scripts/gen-answer.sh tests/29 tests/29.a "tests" ""
echo ""
echo "Generating answer for test #30"
scripts/gen-answer.sh tests/30 tests/30.a "tests" ""
echo ""
echo "Generating answer for test #31"
scripts/gen-answer.sh tests/31 tests/31.a "tests" ""
echo ""
echo "Generating answer for test #32"
scripts/gen-answer.sh tests/32 tests/32.a "tests" ""
echo ""
echo "Generating answer for test #33"
scripts/gen-answer.sh tests/33 tests/33.a "tests" ""
echo ""
echo "Generating answer for test #34"
scripts/gen-answer.sh tests/34 tests/34.a "tests" ""
echo ""
echo "Generating answer for test #35"
scripts/gen-answer.sh tests/35 tests/35.a "tests" ""
echo ""
echo "Generating answer for test #36"
scripts/gen-answer.sh tests/36 tests/36.a "tests" ""
echo ""
echo "Generating answer for test #37"
scripts/gen-answer.sh tests/37 tests/37.a "tests" ""
echo ""
echo "Generating answer for test #38"
scripts/gen-answer.sh tests/38 tests/38.a "tests" ""
echo ""
echo "Generating answer for test #39"
scripts/gen-answer.sh tests/39 tests/39.a "tests" ""
echo ""
echo "Generating answer for test #40"
scripts/gen-answer.sh tests/40 tests/40.a "tests" ""
echo ""
echo "Generating answer for test #41"
scripts/gen-answer.sh tests/41 tests/41.a "tests" ""
echo ""
echo "Generating answer for test #42"
scripts/gen-answer.sh tests/42 tests/42.a "tests" ""
echo ""
echo "Generating answer for test #43"
scripts/gen-answer.sh tests/43 tests/43.a "tests" ""
echo ""
echo "Generating answer for test #44"
scripts/gen-answer.sh tests/44 tests/44.a "tests" ""
echo ""
echo "Generating answer for test #45"
scripts/gen-answer.sh tests/45 tests/45.a "tests" ""
echo ""
echo "Generating answer for test #46"
scripts/gen-answer.sh tests/46 tests/46.a "tests" ""
echo ""
echo "Generating answer for test #47"
scripts/gen-answer.sh tests/47 tests/47.a "tests" ""
echo ""
echo "Generating answer for test #48"
scripts/gen-answer.sh tests/48 tests/48.a "tests" ""
echo ""
echo "Generating answer for test #49"
scripts/gen-answer.sh tests/49 tests/49.a "tests" ""
echo ""
echo "Generating answer for test #50"
scripts/gen-answer.sh tests/50 tests/50.a "tests" ""
echo ""
echo "Generating answer for test #51"
scripts/gen-answer.sh tests/51 tests/51.a "tests" ""
echo ""
echo "Generating answer for test #52"
scripts/gen-answer.sh tests/52 tests/52.a "tests" ""
echo ""
echo "Generating answer for test #53"
scripts/gen-answer.sh tests/53 tests/53.a "tests" ""
echo ""
echo "Generating answer for test #54"
scripts/gen-answer.sh tests/54 tests/54.a "tests" ""
echo ""
echo "Generating answer for test #55"
scripts/gen-answer.sh tests/55 tests/55.a "tests" ""
echo ""
echo "Generating answer for test #56"
scripts/gen-answer.sh tests/56 tests/56.a "tests" ""
echo ""
echo "Generating answer for test #57"
scripts/gen-answer.sh tests/57 tests/57.a "tests" ""
echo ""
echo "Generating answer for test #58"
scripts/gen-answer.sh tests/58 tests/58.a "tests" ""
echo ""
echo "Generating answer for test #59"
scripts/gen-answer.sh tests/59 tests/59.a "tests" ""
echo ""
echo "Generating answer for test #60"
scripts/gen-answer.sh tests/60 tests/60.a "tests" ""
echo ""
echo "Generating answer for test #61"
scripts/gen-answer.sh tests/61 tests/61.a "tests" ""
echo ""
echo "Generating answer for test #62"
scripts/gen-answer.sh tests/62 tests/62.a "tests" ""
echo ""
echo "Generating answer for test #63"
scripts/gen-answer.sh tests/63 tests/63.a "tests" ""
echo ""
echo "Generating answer for test #64"
scripts/gen-answer.sh tests/64 tests/64.a "tests" ""
echo ""
echo "Generating answer for test #65"
scripts/gen-answer.sh tests/65 tests/65.a "tests" ""
echo ""

