/**
 * @author           Suat Secmen (http://suat.be)
 * @copyright        2016 Suat Secmen
 * @license          MIT License <https://github.com/FirePanther/AppleRemindersToTodoist#license>
 */

// config
var listName = '...',
	todoistToken = '...';

// ---------

var app = Application.currentApplication(),

	// get all running processes
	procs = Application('System Events').processes,
	quitAfterFinish = procs.name().indexOf('Reminders') == -1,
	
	r = Application('Reminders'),
	lists = r.lists,
	list = 0;

app.includeStandardAdditions = true;

// find 2Do list
for (var x in lists) {
	if (lists[x].name().indexOf(listName) != -1) {
		list = lists[x];
		break;
	}
}
if (list) {
	// collect commands in this array
	var cmds = [];
	for (var x in list.reminders) {
		// just transfer uncompleted items
		if (!list.reminders[x].completed()) {
			var tmpId = guid(),
			
				// reminder data
				name = list.reminders[x].name(),
				body = list.reminders[x].body(),
				due = list.reminders[x].dueDate(),
				remind = list.reminders[x].remindMeDate(),
				p = list.reminders[x].priority(),
				
				args = {
					content: name,
					priority: p == 1 ? 4 : (p == 5 ? 3 : (p == 9 ? 2 : 1))
				};
			// create item
			if (due) args.date_string = dateStr(due);
			cmds.push({
				type: 'item_add',
				temp_id: tmpId+'1',
				uuid: guid(),
				args: args
			});
			// add body (todoist note)
			if (body) {
				cmds.push({
					type: 'note_add',
					temp_id: tmpId+'2',
					uuid: guid(),
					args: {
						item_id: tmpId+'1',
						content: body
					}
				});
			}
			// add a reminder
			if (remind) {
				cmds.push({
					type: 'reminder_add',
					temp_id: tmpId+'3',
					uuid: guid(),
					args: {
						item_id: tmpId+'1',
						due_date_utc: dateStr(remind, 1)
					}
				});
			}
			// mark as completed
			list.reminders[x].completed.set(true);
		}
	}
	// execute commands (create todoist items) with one request
	if (cmds.length) todoistCmd(cmds);
}
// quit reminders if it wasn't running before
if (quitAfterFinish) r.quit();

/**
 * execute todoist commands (todoist api)
 */
function todoistCmd(cmds) {
	app.doShellScript('curl https://todoist.com/API/v7/sync'+
		' -d token='+todoistToken+' -d commands=\''+JSON.stringify(cmds)+'\'');
}

/**
 * generate unique random string
 * @see: http://stackoverflow.com/a/105074/2284993
 */
function guid() {
  function s4() {
    return Math.floor((1 + Math.random()) * 0x10000)
      .toString(16)
      .substring(1);
  }
  return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
    s4() + '-' + s4() + s4() + s4();
}

/**
 * format date object to string (yyyy-mm-ddThh:ii)
 */
function dateStr(date, utc) {
	utcStr = utc ? 'UTC' : '';
	var year = date['get'+utcStr+'FullYear'](),
		month = (date['get'+utcStr+'Month']() < 9 ? '0' : '')+(date['get'+utcStr+'Month']()+1),
		day = date['get'+utcStr+'Date'](),
		hour = (date['get'+utcStr+'Hours']() < 10 ? '0' : '')+date['get'+utcStr+'Hours'](),
		min = (date['get'+utcStr+'Minutes']() < 10 ? '0' : '')+date['get'+utcStr+'Minutes']();
	return year+'-'+month+'-'+day+'T'+hour+':'+min;
}