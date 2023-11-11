# UnixLib
A Minecraft Data Pack library that lets you get the real life date & time ingame. For inquiries, please contact **@silicatYT** on Discord.

## Features
- Get the real life date & time
  - Year, Month, Day, Week Day, Hour, Minute, Second & the Unix Timestamp.
- Support for different timezones & daylight savings time.
- Any values provided have **tick accuracy**.
- Very **high efficiency**.
- Convert any Unix Timestamp into a date & time.

## How to use
UnixLib automatically keeps track of the date & time for you. For that to work, you first need to configure the settings to your personal taste. To access the settings, click the message that appears in chat after reloading or manually run **/function unixlib:unix/settings**.
### Settings
- **Command Block Offset (value):** This setting specifies the time difference between the UTC timezone and your system time in seconds. Example: If your system clock is 1 hour behind compared to the UTC timezone, the setting's value would have to be set to -3600.
- **Timezone Offset (value):** This setting specifies the time difference between your system time and your desired timezone in seconds. Example: If your desired timezone is 2 hours ahead of your system clock, the setting's value would have to be set to 7200.
- **Realtime Tracking [Singleplayer | Multiplayer]:** This setting controls whether UnixLib should work in Singleplayer or not. If your world can be played in both Singleplayer and Multiplayer, it is advised to select the former option.
  - If **Singleplayer** is selected, the time will stay in sync even after pausing & unpausing. This comes at a small performance cost.
  - If **Multiplayer** is selected, these checks will not be performed. This results in slightly better performance.
- **Daylight Savings Time Checks [Off | Hourly]:** This setting controls whether UnixLib automatically detects and adjusts for time shifts caused by daylight savings time.
  - If **Off** is selected, daylight savings time will only be checked for every time the function **unixlib:unix/update** is run, either manually or by other functions in the Data Pack (e.g. on reload or when changing settings).
  - If **Hourly** is selected, daylight savings time will be checked for every hour. This comes at a very small performance cost. The correct time will be displayed **2 ingame ticks** after the hour changes.
### Get the real life date & time
The values for Year, Month, Day, Week Day, Hour, Minute, Second & the Unix Timestamp are all stored inside the player **'#UnixLib'**, with each value having its own scoreboard objective:
- UnixLib_Year, UnixLib_Month, UnixLib_Day, UnixLib_WeekDay, UnixLib_Hour, UnixLib_Minute, UnixLib_Second & UnixLib_UnixTime
### Convert any Unix Timestamp into a date & time
**Note:** Any output is automatically adjusted for the timezone specified in the first two settings.
- Set the scoreboard **UnixLib** of the player **'#UnixLib_Input'** as the input.
- Run **/function unixlib:unix/get_date**.
- The output values will be stored inside the player **'UnixLib_Output'**.

## How it works
UnixLib combines the with Base64 encoded Unix Timestamp found within player heads with the daytime found within command block outputs to get the current date & time. To achieve tick accuracy, UnixLib checks a repeating command block's time output every tick to see when it changes. At that point it uses several calculations & the macros introduced in 1.20.2 to schedule functions to run when the next second, minute, hour and day passes. This means that once time is synced, no further commands except for these scheduled functions have to run.

Further logic and calculations are necessary to support edge cases such as daylight savings time, Singleplayer support, what should happen if the Unix Timestamp from the player head is from a different day etc. We hope that with this library, nobody will have to deal with these troubles anymore.

## Credit
From CMDred:
- **SilicatYT:** Unix Lib
- **BananaRedPanda:** Base64 Decoder, Consulting & Help with formulas

## License
As per the MIT License, you are allowed to redistribute, modify and use UnixLib as long as we are credited for the original work.
