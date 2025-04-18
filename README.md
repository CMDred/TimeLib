# TimeLib
A Minecraft Data Pack library that lets you get the real life date & time ingame. For inquiries, please contact **@silicatYT** on Discord.\
\
Download: [Modrinth](https://modrinth.com/datapack/timelib)\
Report bugs: [GitHub](https://github.com/CMDred/TimeLib)

## Features
- Get the real life date & time:
  - Year, Month, Day, Week Day, Hour, Minute, Second & the Unix Timestamp
- Support for different timezones & daylight savings time
- Any values provided have **tick accuracy**
- Very **high efficiency**
- Convert any Unix Timestamp into a date & time
- Support for lag, different tick rates & pausing

## How to use
TimeLib automatically keeps track of the date & time for you. For that to work, you first need to configure the settings to your personal taste. To access the settings, click the message that appears in chat after reloading or manually running `/function timelib:util/settings`.
### Settings
- `Command Block Offset` (value): This is required to offset the time difference between the UTC timezone and your system time.
  - **Example:** UTC (7pm), System clock (8pm) &rarr; Use 1h
- `Timezone Offset` (value): Use this to change the displayed time.
  - **Example:** 8pm + 1h offset &rarr; 9pm
### Get the real life date & time
The values for Year, Month, Day, Week Day, Hour, Minute, Second & the Unix Timestamp are all stored inside the player `#TimeLib`, with each value having its own scoreboard objective:
- `TimeLib.Year, TimeLib.Month, TimeLib.Day, TimeLib.WeekDay, TimeLib.Hour, TimeLib.Minute, TimeLib.Second & TimeLib.UnixTime`

Additionally, string versions of the Day, WeekDay and Month are stored in the `timelib:date` storage.

### Events
- `#timelib:date_changed`: Function tag that gets executed whenever the date changes
- `#timelib:daytime_changed`: Function tag that gets executed whenever the daytime changes

### Convert any Unix Timestamp into a date & time
**Note:** Any output is automatically adjusted for the timezone specified in the first two settings.
- Set the scoreboard `TimeLib.UnixTime` of the player `#TimeLib.Input` as the input.
- Run `/function timelib:util/unix_timestamp_to_date`.
- The output values will be stored inside the player `#TimeLib.Output`'s `TimeLib.?` scores, as well as the `timelib:output` data storage.

## How it works
TimeLib combines the with Base64 encoded Unix Timestamp inside player heads with the daytime information inside command block outputs to calculate the current date & time. Additional logic is used to ensure optimal results and accuracy.

## Credit
From CMDred:
- **SilicatYT:** TimeLib
- **BananaRedPanda:** Base64 Decoder & Help

## Good to know
- TimeLib requires an internet connection.
- When starting the server or world, it takes a second for time to update. Any checks that happen during that time are wrong.
- If your Data Pack uses a forceloaded chunk at `29999999 29999999` in the overworld, there may be collision.
- TimeLib uses the [lantern load](https://github.com/LanternMC/load) library that lets you control the order in which data packs load.

## License
As per the MIT License, you are allowed to redistribute, modify and use TimeLib as long as we are credited for the original work.
