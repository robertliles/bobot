module.exports = (robot) -> 

    localTime = (offset) ->
        localDateMillis = new Date().getTime() + offset * 3600 * 1000
        localDate = new Date(localDateMillis)
        localDate.toUTCString().replace(/GMT$/, "")

    localTimeTokyo = localTime(9)
    hoursToMorning = 6 - new Date(localTimeTokyo).getHours()

    robot.hear /@bob/i, (res) ->   
        res.send "This is Bob’s robot stand-in. Human Bob is currently in Tokyo where it is #{localTimeTokyo}. " +
            "He will see this message when he wakes up in approximately #{hoursToMorning} hours. Have a nice day! :sunny:"