# TimeLib
A Minecraft Data Pack library that lets you get the real life date & time ingame. For inquiries, please contact **@silicatYT** on Discord.

## Features
- Get the real life date & time:
  - Year, Month, Day, Week Day, Hour, Minute, Second & the Unix Timestamp
- Support for different timezones & daylight savings time.
- Any values provided have **tick accuracy**.
- Very **high efficiency**.
- Convert any Unix Timestamp into a date & time.

## How to use
TimeLib automatically keeps track of the date & time for you. For that to work, you first need to configure the settings to your personal taste. To access the settings, click the message that appears in chat after reloading or manually running `/function timelib:util/settings`.
### Settings
- `Command Block Offset` (value): This setting specifies the time difference between the UTC timezone and your system time. Example: If your system clock is 1 hour behind compared to the UTC timezone, the setting's value would have to be set to -1.
- `Timezone Offset` (value): This setting specifies the time difference between your system time and your desired timezone. Example: If your desired timezone is 2 hours ahead of your system clock, the setting's value would have to be set to 2.
- `Realtime Tracking` [Singleplayer | Multiplayer]: This setting controls whether TimeLib should work in Singleplayer or not. If your world can be played in both Singleplayer and Multiplayer, it is advised to select the former option.
  - If `Singleplayer` is selected, the time will stay in sync even after pausing & unpausing. This comes at a small performance cost.
  - If `Multiplayer` is selected, these checks will not be performed. This results in slightly better performance.
- `Daylight Savings Time Checks` [Off | Hourly]: This setting controls whether TimeLib automatically detects and adjusts for time shifts caused by daylight savings time.
  - If `Off` is selected, daylight savings time will only be checked for every time the function `timelib:util/update` is run, either manually or by other functions in the Data Pack (e.g. on reload or when changing settings).
  - If `Hourly` is selected, daylight savings time will be checked for every hour. This comes at a very small performance cost. The correct time will be displayed **2 ingame ticks** after the hour changes.
### Get the real life date & time
The values for Year, Month, Day, Week Day, Hour, Minute, Second & the Unix Timestamp are all stored inside the player `#TimeLib`, with each value having its own scoreboard objective:
- `TimeLib.Year, TimeLib.Month, TimeLib.Day, TimeLib.WeekDay, TimeLib.Hour, TimeLib.Minute, TimeLib.Second & TimeLib.UnixTime`

Additionally, string versions of the Day, WeekDay and Month are stored in the `timelib:date` storage.

### Events
Every time the date changes (or TimeLib updates the time), the function tag `#timelib:time_updated` is executed.

### Convert any Unix Timestamp into a date & time
**Note:** Any output is automatically adjusted for the timezone specified in the first two settings.
- Set the scoreboard `TimeLib` of the player `#TimeLib.Input` as the input.
- Run `/function timelib:util/get_date`.
- The output values will be stored inside the player `#TimeLib.Output`'s `TimeLib.XXX` scores, as well as the `timelib:output` data storage.

## How it works
TimeLib combines the with Base64 encoded Unix Timestamp found within player heads with the daytime found within command block outputs to get the current date & time. To achieve tick accuracy, TimeLib checks a repeating command block's time output every tick to see when it changes. At that point it uses several calculations & the macros introduced in 1.20.2 to schedule functions to run when the next second, minute, hour and day passes. This means that once time is synced, almost no further commands are needed.

Further logic and calculations are necessary to support edge cases such as daylight savings time, Singleplayer support, what should happen if the Unix Timestamp from the player head is from a different day etc. We hope that with this library, nobody will have to deal with these troubles anymore.

## Credit
From CMDred:
- **SilicatYT:** TimeLib
- **BananaRedPanda:** Base64 Decoder, Consulting & Help with formulas

## Good to know
- TimeLib requires an internet connection.
- `/tick` is NOT supported. Time desyncs with `/tick rate` or `/tick sprint`, and the `Daylight Savings Time Checks` setting breaks entirely. Time always has to be manually updated after using this command.
- When starting the server or world, it takes a second for time to update. Any checks that happen during that time are wrong.
- When time is updated (Through `/function timelib:util/update`, when changing settings or when the world is reloaded/restarted), the new time will only display 2 ticks after.
- If your Data Pack checks for a TimeLib score before TimeLib's functions have run, your Data Pack will get the previous tick's scores. To avoid that, make sure that TimeLib always runs first.
- If your Data Pack uses a forceloaded chunk at `29999983 29999983`, there may be collision.

## License
As per the MIT License, you are allowed to redistribute, modify and use TimeLib as long as we are credited for the original work.
