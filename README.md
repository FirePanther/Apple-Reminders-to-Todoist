# Apple Reminders to Todoist (for macOS)

This script transfers your reminders from Apple Reminders to your Todoist.

![Transfer your Apple Reminders to Todoist](http://i.dv.tl/sc1_2.png)  
![All accessible information will be transferred](http://i.dv.tl/sc2_2.png)

## What information will be transferred

- The title/name of the reminder
- The body/description (adds a Todoist "note") - *only Todoist Premium*
- The due/remind date (in Apple Reminders both dates are the same) - *only
Todoist Premium*
- The priority

## What *NOT*

*(Applescript has no access to these information yet)*

- Remind by location
- Remind interval/repetition (e.g. daily)

## Why/When you should use this script?

If you prefer to use Todoist over Reminders but still want to use Siri for
creating ToDo's (e.g. on your iPhone or on your Apple Watch). You could use some
Apps like IFTTT or Workflow but they just don't transfer important information
like the due date (and I use `"Hey Siri, remind me to do that at 3 pm"` on
my Apple Watch alot).

## Edit and Configure

You can edit this code, just make sure to select `JavaScript` as the language
in `Script Editor`.

At the top you'll find the lines:

```javascript
// config
var listName = '...',
	todoistToken = '...';
```

Just write your Apple Reminders list name (case sensitive, doesn't have to be
the full name, e.g. if you use Emojis) and your Todoist token (which can be
found in the `Todoist Settings` > `Account` > `API token`).

## Run

You can run this script manually by opening it in `Script Editor` (and choosing
the `JavaScript` language) and running it (`CMD + R`), or by running it via
Terminal:  
`osascript -l JavaScript remindersToTodoist.applescript`

Or run this script automatically (like daily or hourly) via cronjob. You can
edit your cronjobs by runningy `crontab -e` on the Terminal or just install
[Cronnix](https://www.macupdate.com/app/mac/7486/cronnix) for editing over a GUI.

## Recommended

If you run this script as a cron job (like me) and it's annoys you to see the
Reminders app icon in the Dock every few hours (like me), you can hide the
Reminders Dock icon with this script:  
https://github.com/FirePanther/MacOS-Hide-Dock-Icon

After hiding the icon you have to run the Reminders app, accept everything
(Reminders want to access this and that), quit the app and open it again.
If everything is fine you should see your lists and reminders and no Dock icon.

# License

#### MIT License

#### Copyright (c) 2016 Suat Secmen

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.