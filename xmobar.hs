Config { font = "-*-Fixed-Bold-R-Normal-*-13-*-*-*-*-*-*-*"
        , borderColor = "black"
        , border = TopB
        , bgColor = "black"
        , fgColor = "grey"
        , position = TopW L 100
        , commands = [ Run Weather "CYVR" ["-t","<tempC>C","-L","18","-H","25","--normal","green","--high","red","--low","lightblue"] 36000
                        , Run Network "enp0s31f6" ["-L","0","-H","32","--normal","green","--high","red"] 30
                        , Run Cpu ["-L","3","-H","50","--normal","green","--high","red"] 10
                        , Run Memory ["-t","Mem: <usedratio>%"] 10
                        , Run Swap [] 10
                        , Run Com "uname" ["-s","-r"] "" 36000
                        , Run Date "%a %b %_d %Y %H:%M:%S" "date" 10
                        , Run BatteryP    ["BAT0"]
                       [ "--template", "Batt: <acstatus>"
                       , "-L", "15", "-H", "85", "-p", "3"
                       , "-l", "red", "--normal", "blue", "-h", "green"
                       , "--" -- battery specific options
                           , "-o", "<left>%", "-O", "<left>%", "-i", "<left>%" 
                         ] 50
                        , Run Wireless "wlp4s0" ["-t", "<essid> <qualitybar>"] 30
                        , Run StdinReader
                        ]
        , sepChar = "%"
        , alignSep = "}{"
        , template = "%StdinReader% | %cpu% | %memory% * %swap% | %enp0s31f6% | %wlp4s0wi% }{<fc=#ee9a00>%date%</fc> | %uname% | %battery% "
        }
