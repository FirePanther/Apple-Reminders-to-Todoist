# Apple Reminders to Todoist (for macOS)

This script transfers your reminders from Apple Reminders to your Todoist.

![Transfer your Apple Reminders to Todoist](http://i.dv.tl/sc1.png)  
![All accessible information will be transfered](http://i.dv.tl/sc2.png)

## Which information will be transfered

- The title/name of the reminder
- The body/description (adds a Todoist "note") - *only Todoist Premium*
- The due/remind date (in Apple Reminders both dates are the same) - *only
Todoist Premium*
- The priority

## Which NOT

*(Applescript has no access to these information yet)*

- Remind by location
- Remind interval/repetition (e.g. daily)

## Why/When you should use this script

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
