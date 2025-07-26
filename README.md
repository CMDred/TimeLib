# TimeLib
A Minecraft Data Pack library that lets you get the real life date & time ingame. For inquiries, please contact **@silicatYT** on Discord.\
\
Download: [Modrinth](https://modrinth.com/datapack/timelib)\
Report bugs: [GitHub](https://github.com/CMDred/TimeLib)

## Features
- Provides the real life date & time with tick accuracy:
  - Year, Month, Day, Week Day, Hour, Minute, Second & the Unix Timestamp
- Provides the current tickrate
- Detects pausing the game & the pause duration (e.g. `/tick freeze` or singleplayer)
- Convert any Unix Timestamp into a date & time
- Supports different timezones & daylight savings time
- Supports lag, different tick rates & pausing
- High efficiency

## How to use
TimeLib automatically keeps track of the date & time for you. For that to work, you first need to configure the settings to your personal taste. To access the settings, click the message that appears in chat after reloading, or manually run `/function timelib:util/settings`.
### &rarr; Settings
- `Command Block Offset`: This is required to offset the time difference between the UTC timezone and your system time. If daylight savings change, this setting needs to be adjusted to ensure that the date calculation works properly.
  - **Example:** UTC (7pm), System clock (8pm) &rarr; Use 1h
- `Timezone Offset`: Use this to change the displayed time.
  - **Example:** 8pm + 1h offset &rarr; 9pm
### &rarr; Get the real life date & time
The values for Year, Month, Day, Week Day, Hour, Minute, Second & the Unix Timestamp are all stored inside the player `#TimeLib`, with each value having its own scoreboard objective:
- `TimeLib.Year, TimeLib.Month, TimeLib.Day, TimeLib.WeekDay, TimeLib.Hour, TimeLib.Minute, TimeLib.Second & TimeLib.UnixTime`

Additionally, string versions (with leading 0s) of the date and daytime are stored in the `timelib:date` and `timelib:daytime` storages.

### &rarr; Events
- `#timelib:date_changed`: Function tag that gets executed whenever the date changes
- `#timelib:daytime_changed`: Function tag that gets executed whenever the daytime changes
- `#timelib:game_unpaused`: Function tag that gets executed whenever the game unpauses
  - The `#TimeLib TimeLib.PausedTicks` scoreboard holds the number of ticks the game has been paused for

### &rarr; Get the tickrate
The tickrate updates once per second and can be read from the `TimeLib.Tickrate` scoreboard objective.

### &rarr; Convert any Unix Timestamp into a date & time
**Note:** The output date & time are in the UTC timezone, as daylight savings time cannot be properly accounted for.

- Set the `#TimeLib.Input TimeLib.UnixTime` score as the input.
- Run `/function timelib:util/unix_timestamp_to_date`.
- The output values will be stored inside the `#TimeLib.Output TimeLib.?` scores, as well as the `timelib:output` data storage.

## How it works
- TimeLib combines the with Base64 encoded Unix Timestamp inside player heads with the daytime information inside command block outputs to calculate the current date & time.
- To get the tickrate, TimeLib counts the number of ticks between each daytime change.
- The pause detection uses the `minecraft.custom:minecraft:total_world_time` scoreboard objective, which increments every tick even while the game is paused.

Additional logic is used to ensure optimal results, good performance and accuracy.

## Credit
From CMDred:
- **SilicatYT:** TimeLib
- **BananaRedPanda:** Base64 Decoder & Help

## Good to know
- TimeLib requires an internet connection.
- Getting the tickrate does not utilize worldborder shenanigans.
- If your Data Pack uses a forceloaded chunk at `29999999 29999999` in the overworld, there may be collision.
- TimeLib (2.3.0 and newer) uses the [lantern load](https://github.com/LanternMC/load) library that lets you check for dependencies. If you follow its conventions:
  - `#TimeLib load.status`: 1 if TimeLib is installed, otherwise unset
  - `#TimeLib.Version load.status`: Release-specific number
- Upgrade to a newer release:
  - For TimeLib releases **before 2.3.0**: `/function timelib:uninstall`, then replace your current TimeLib version with the new one, then `/reload` to install the new version
  - For upgrading from **release 2.3.0 or later** to a newer release, simply replace the old datapack with the new one
- (v2.3.0+) TimeLib **throws errors and stops working if multiple different releases are installed simultaneously**. This extends to trying to call utility functions.
  - Similar behaviour occurs when trying to run utility functions after running `/function timelib:uninstall`

## License
As per the MIT License, you are allowed to redistribute, modify and use TimeLib as long as we are credited for the original work.
