
  SciTE Jump V2.0.92.169

-----------------------------

网页: http://softwarespot.wordpress.com/code/scite-jump/
语言: 多国语言

  描述
-----------------------------
SciTE Jump 是 SciTE4AutoIt3 一个有益的补充工具, 提供了在脚本的函数,注释,代码段之间快速和有效的跳转方式. 允许你导出你的代码为 HTML, PDF 或 Text. 同时可导出脚本的函数, 变量, 代码段清单.

使用热键 F1 显示内置的帮助文件.

注意: 此工具现在正式列入 SciTE4AutoIt3 包.


How to Install
-----------------------------
SciTE Jump can be run 'straight out of the box' but if you wish to integrate into SciTE then right click on the titlebar and select 'Add to SciTE.' This will then allow you to access SciTE Jump by calling the hotkey Ctrl + Alt + J.


  GUI
-----------------------------
The GUI is designed to be simple thus allowing you to create code quickly and efficiently. The inputs at the top are for searching the function list as well as navigating to a specific line within the code. The input in the lower portion of the GUI is for searching a keyword within an AutoIt script, you can change the location to search by selecting the folder icon. This addition is great if you only know a portion of the function you wish to use.

The following HotKeys are supported:
Ctrl + F - Automatically highlight the search input to search the function list. 


  Extended Functionality
-----------------------------
None


  Thanks
-----------------------------
I would like to extend a big thank you to all who took the time to test the application in it's infancy. I would also like to aknowledge Ashalshaikh & Melba23 for their individual efforts in creating this application.

This program wouldn't have been possible without the wonderful community on the AutoIt Forums [http://www.autoitscript.com/forum/]


  License
-----------------------------
SciTE Jump is released under GPLv3 (please see License.txt for more details) and all credit should be made towards the original authors where applicable.


  更新日志
-----------------------------
Version 2.0.92.169 [17-03-2013]
- ADDED: Additional settings for searching in comments and regions. [Optional] (Thanks mlipok)
- ADDED: Exporting details has now been improved by removing Global variables in the script file and includes.
- ADDED: Option to either dock to the left or right of SciTE as well as automatic docking depending on the location of SciTE Jump relative to SciTE. [Optional] (Thanks Noddle)
- ADDED: Resetting previous search results when selecting the refresh button. I removed this feature a couple of versions ago but was asked to re-instate. (Thanks mlipok)
- ADDED: Searching within files using an empty string, will display all the AutoIt scripts in the selected folder. A sort of simple 'Snippet Holder'.
- ADDED: Selecting Ctrl+Alt+J when SciTE Jump has focus, will put the focus back to SciTE. (Thanks mlipok)
- ADDED: Settings UI for easily changing settings for SciTE Jump.
- ADDED: Starting another instance of SciTE Jump will automatically focus the search input. [Optional] (Thanks mlipok)
- FIXED: Default size of SciTE Jump.
- FIXED: Highlighting the last used function.
- FIXED: Including the main script file would display duplicate functions. Though it's not recommended to include the same file, this still shouldn't have happened. (Thanks mlipok)
- FIXED: Opening a custom UDF function.
- FIXED: SciTE Jump incorrectly docking when the taskbar was left of the monitor. (Thanks mlipok)
- IMPROVED: Detection of Global/Local variables when exporting function data.
- IMPROVED: French language. (Thanks ricky03)
- IMPROVED: Monitor.a3x to version 12. This will automatically update if you have an older version.
- IMPROVED: Monitoring of function to line by moving to Monitor.a3x.
- IMPROVED: Moved retrieving additional info about a script file to Monitor.a3x.
- IMPROVED: Removed unused Global variables and unnecessary functions.
- IMPROVED: Re-wrote the code for adding SciTE Jump to SciTE.
- IMPROVED: Re-wrote upgrading of SciTE Jump if it already exists in the SciTE folder.

Version 1.33.84.157 [28-02-2013]
- ADDED: Activate the search input on startup. (Thanks mlipok)
- ADDED: If changing SciTE Tabs and a search string is present, then search the new file. (Thanks mlipok)
- ADDED: If SciTE Jump is minimised it will be restored if a new instance of SciTE Jump is started.
- ADDED: Italian language. (Thanks Nessie)
- ADDED: Remember the last used filetypes to search for when replacing within files.
- ADDED: Remove user custom comments when parsing a script file.
- ADDED: Retain the docking state of SciTE Jump when closed or SciTE is closed. (Thanks tproli)
- ADDED: Select the export file when opening the directory location. (Thanks mlipok)
- ADDED: Stripped EndFunc comments for appearing in the comment section of the treeview.
- FIXED: Changing tabs with data in the search field, would cause the last function to be jumped to.
- FIXED: Comment blocks not displaying in the comment list.
- FIXED: Function snippet EndFunc comment incorrectly positioned to how Tidy positions it.
- FIXED: LineToPixel incorrectly jumping to the line.
- FIXED: Right click context menu not displaying when selecting custom UDFs.
- FIXED: SciTE Jump incorrectly jumping to a function with a similar name. (Thanks tproli)
- FIXED: Variables that were not initialised wouldn't be exported.
- FIXED: When function to line was enabled selecting the first line of the function wouldn't register a jump in the list.
- IMPROVED: CPU usage of searching or replacing within files.
- IMPROVED: Listing functions in custom user include files. Now it uses the same principle as AutoIt does and as outlined in the help file. (Thanks mlipok and wraithdu)
- IMPROVED: Speed of function to line, by stripping lines that don't start with Func or EndFunc.
- UPDATED: Polish translation. (Thanks mlipok)

Version 1.32.75.145 [20-02-2013]
- ADDED: Listing functions in custom user include files. This is an optional setting via the titlebar context menu. (Thanks Sunaj and mlipok)
- ADDED: Load a SciTE.session file by dragging it to the SciTE Jump treeview. (Thanks Sunaj)
- ADDED: Manually add LineToPixel to the general section of the INI file to specify whether or not a function should appear at the top or a specified number of pixels e.g. 180
So for example if you would like the function to appear 190px from the top of ScITE, add LineToPixel=190 to the INI file. Default is 0. Note: There will be a setting in later versions of SciTE Jump. (Thanks tproli)
- FIXED: Error if Monitor.a3x didn't exist.
- FIXED: Export list returning incorrect number of unused functions. This was a regression from V1.31.72.125.
- FIXED: Export list returning incorrect number of variables inside a function.
- FIXED: Includes regular expression.
- FIXED: Remembering the last function selected in the treeview.
- FIXED: Rename in files text was offset incorrectly when docking SciTE Jump to SciTE.
- FIXED: Searching within the function list and swapping between SciTE tabs, would cause the treeview to be unresponsive.
- FIXED: Starting SciTE if it was not running already.
- FIXED: Temporary dat file not being erased on reading/writing error.
- FIXED: The Func keyword displaying in the search results.
- FIXED: Using the refresh button would cause the treeview to be unresponsive until changing the SciTE tab or file.
- IMPROVED: Functions regular expression.
- IMPROVED: Monitor.a3x to version 10. This will automatically update if you have an older version.
- IMPROVED: Now uses Monitor.a3x to find in files, resulting in a speed increase.
- IMPROVED: Parsing of comments and regions.
- IMPROVED: Replacing in files.
- IMPROVED: Speed of "function to line" parsing.
- IMPROVED: Speed of creating a unique array. (Thanks Yashied)
- IMPROVED: Speed of exporting the script details.
- IMPROVED: Overall memory consumption and CPU usage.

Version 1.31.72.125 [06-02-2013]
- ADDED: Open file location to the right click context menu.
- ADDED: Replacing in files to Monitor.a3x to stop SciTE Jump from hanging. This has increased the speed of renaming.
- FIXED: Closing of redundant Monitor.a3x processes.
- FIXED: Dimming the GUI of SciTE Jump has been improved.
- FIXED: Functions displaying in the list if commented out in the script.
- FIXED: Selecting cancel when replacing in files would cause the process to start again.
- IMPROVED: German translation. (Thanks burnell)
- IMPROVED: Monitor.a3x to version 9. This will automatically update if you have an older version.
- IMPROVED: Searching through the list of functions by adding a 750ms timer before displaying the results.
- IMPROVED: Source code by replacing variables that are constants with the Const keyword.
- IMPROVED: Speed of selecting a treeview item and navigating to the particular item in SciTE.
- IMPROVED: Various undocumented bug fixes.
- REMOVED: Unused functions in the source code.

Version 1.30.70.114 [04-01-2013]
- IMPROVED: Resetting of SciTE Jump as well monitoring when a SciTE tab changes. This is now achieved by running Monitor.a3x as the start of SciTE Jump.
- IMPROVED: Monitor.a3x to version 8. This will automatically update if you have an older version.

Version 1.29.70.112 [10-12-2012]
- ADDED: Additional option to the system and context menu for resetting SciTE Jump. This is useful if you use hibernation within Windows and SciTE Jump stops recognising when the filepath changes in SciTE.
- ADDED: Option to cancel processing a file if the total number of functions and/or regions is greater than 7500. This is useful for the considerably large UDFs which are available.
- FIXED: Missing language string for the set button. (Thanks ricky03)
- FIXED: Non-ASCII characters displaying an unexpected SciTE message box when used in the file path. (Thanks kyo)
- FIXED: Translation difference file was incorrectly referencing the most outdated version.

Version 1.28.68.109 [05-12-2012]
- FIXED: Saving position of SciTE Jump if SciTE is closed unexpectedly.
- IMPROVED: Approach to monitoring when a tab in SciTE is changed, now it's instantaneous instead of a 500ms delay.
- IMPROVED: Monitor.a3x to version 7. This will automatically update if you have an older version.
- IMPROVED: Now Windows handles the memory management of SciTE Jump.

Version 1.27.68.105 [19-11-2012]
- FIXED: Context menu not working correctly when displaying the 'replace in files' UI.
- IMPROVED: Monitor.a3x to version 6. This will automatically update if you have an older version.

Version 1.26.68.103 [29-10-2012]
- FIXED: Cancelling find in files would not close the running process.
- FIXED: Monitor incorrectly positioning SciTE when the taskbar was on the left side of the screen.
- IMPROVED: Monitor.a3x to version 5. This will automatically update if you have an older version.
- IMPROVED: Speed of replacing in files and finding in files.
- IMPROVED: Various source code changes for better clarity.

Version 1.25.68.98 [19-09-2012]
- FIXED: Issue with the search treeview not displaying.
- FIXED: Out of bounds error.

Version 1.24.68.96 [19-09-2012]
- FIXED: If a function name was inside a comment or comment block, then it would highlight the comment instead of the function upon refresh of SciTE Jump. (Thanks wraithdu) 
- FIXED: Issue with the treeview being out of bounds when docking to SciTE.
- IMPROVED: Approach to navigating through the treeview. This should be a lot quicker.
- IMPROVED: Monitor.a3x to version 4. This will automatically update if you have an older version.

Version 1.23.68.92 [18-09-2012]
- ADDED: Increased performance of clearing the array and treeview items.
- ADDED: Selecting the line input will navigate to the line currently in the input field.
- FIXED: Issue with the search input loosing focus when searching within the function list. 
- FIXED: Search input now works correctly when searching within the find in files list.
- FIXED: Treeviews randomly disappearing every so often.
- IMPROVED: Memory consumption due to the improvement of clearing the array and treeview items.
- IMPROVED: Response of displaying the appropriate treeview.
- IMPROVED: Speed of deleting items in the treeview as well as reducing flickering of certain controls.

Version 1.22.66.86 [13-09-2012]
- FIXED: Out of bounds issue caused by restructuring the source code. (Thanks wraithdu)

Version 1.21.66.85 [13-09-2012]
- ADDED: Option to the right-click menu for replacing text within files to display the difference in WinMerge (must be installed on your system or edit the INI file preference WinMergePath.)
- ADDED: Selecting the regular expression checkbox will disable the case sensitive checkbox.
- FIXED: Error saving the last current position and size when restarting SciTE Jump and SciTE.
- FIXED: Issue with certain installations of SciTE4AutoIt3 not displaying the full path in the title bar. The parameter title.full.path=1 will automatically be added to SciTEUser.properties to override the default value in SciTEGlobal.properties.
- FIXED: 'Preview before' and 'case sensitive' checkboxes would incorrectly display when re-sizing the UI.
- FIXED: Various bug fixes due to improving the source code layout.
- IMPROVED: Source code layout.
- IMPROVED: Speed of creating the treeview items as well as overall optimisation of functions.

Version 1.20.64.79 [07-09-2012]
- FIXED: Issue incorrectly displaying the number of functions in a script.

Version 1.19.64.78 [17-07-2012]
- IMPROVED: Regular expressions tenfold with the help and guidance of Robjong. Now all types of comments are parsed. (Thanks Robjong)

Version 1.18.64.77 [11-05-2012]
- ADDED: Double-clicking on the client area of the GUI will now dock or undock SciTE Jump to SciTE.
- ADDED: Option to change the UDF header name.
- ADDED: Regular expression searching for 'replace within files.'
- FIXED: Caret wouldn't move to the end of the search input after a certain amount of characters were entered.
- FIXED: Issue when selecting the 'find in files' input with text present in the search input would cause an overlapping error.
- FIXED: Issue with re-sizing of the GUI. This affected the 'preview before' and 'case-sensitive' checkboxes.
- FIXED: Previewing 'replace in files' search results would only replace the supported files and not the filetypes specified in the input.
- IMPROVED: Source code layout of language strings.
- IMPROVED: Speed of searching within the function list.

Version 1.17.61.71 [28-04-2012]
- ADDED: Progress bar to searching within files to visually show searching is in progress.
- ADDED: Revert back to normal mode if in dock mode to save the position of SciTE Jump.
- ADDED: Saving the last current position. (Thanks Yashied)
- ADDED: SciTE Jump will now adjust the height of the SciTE Jump window relative to SciTE. Only in dock mode. (I wanted to add this back in V1.15.55.57)
- FIXED: Bug where 'Array variable has incorrect number of subscripts' would occur at certain intervals when using the 'automatically scroll within SciTE Jump' feature. (Thanks UEZ)
- FIXED: Issue when docking to SciTE would cause the UI to sometimes look a little out of place. (Thanks wraithdu)
- FIXED: Issue with button images not displaying correctly in Windows XP.
- FIXED: Issue with displaying SciTE4AutoIt3's help file if using an older version. Now SciTE Jump's help file is automatically used instead.
- FIXED: Issue with Windows XP when docking the GUI to the right side of SciTE and changing the style.
- FIXED: Right-click context menu not displaying on the search or find in files results.
- FIXED: Right-click menu on the GUI not displaying when in dock mode.
- REMOVED: Tooltips to certain controls for now as this was causing a conflict with SciTE's replace dialogue.

Version 1.16.58.64 [27-04-2012]
- ADDED: Automatically scroll to the function in SciTE Jump the caret is in between. This is optional and can be turned on by right-clicking on the titlebar. (Thanks Mat & UEZ)
- ADDED: Right-click context menu to the SciTE Jump GUI, to access the titlebar items, such as toggling between sorting items. (Thanks D4RKON3)
- ADDED: Tooltips to certain controls. Language files will need to be updated to accommodate this change. (Thanks D4RKON3)
- FIXED: Issue trying to highlight the text in the search input.
- FIXED: Issue where functions in between comments would show up in the treeview. Idea from ISI360, the author of ISN AutoIt Studio.
- IMPROVED: Issue where the right-click context menu would display when clicking on the header text.
- IMPROVED: Now the right-click context menu will display limited options when selecting a region or comment item, rather than the full context menu.

Version 1.15.55.57 [23-04-2012]
- ADDED: Disabling of relevant items if the file is supported by SciTE Jump but isn't an au3 file.
- ADDED: Monitoring the SciTE Window position and moving accordingly when docked to SciTE.
- ADDED: Opening of the file when double clicking on the item in the replacing in files GUI.
- ADDED: Option to specify different filetypes when replacing within files e.g. au3;txt or leave blank for all files.
- ADDED: Popup window style when docking to the right of SciTE. (Thanks UEZ)
- ADDED: Restoring of the SciTE Window upon exit if the window was docked to the right of SciTE. (Thanks UEZ)
- ADDED: Right-click context menu for find in files.
- ADDED: Right-click context menu to the preview GUI for replacing in files.
- ADDED: Right-click context menu with limited options for search results.
- ADDED: Selecting the 'Enter' key when the replace in files inputs have focus will start the replacing process.
- FIXED: Clearing the folder combobox would still result in the last folder being remembered.
- FIXED: Find in Files now searches in all files instead of just au3 files.
- FIXED: Issue where the treeview would disappear periodically.
- FIXED: Location of the export file opening when an error occurred.
- FIXED: Right-click context menu displaying when the file was empty.
- IMPROVED: Disable the export right-click context-menu when the file isn't supported by SciTE Jump or doesn't exist.
- IMPROVED: Finding in files function.

Version 1.14.44.50 [15-04-2012]
- ADDED: Button to load the folder of where Obfuscator is located.
- ADDED: Now loads/restarts SciTE in Portable mode if SciTE4AutoIt3 isn't installed on the machine.
- ADDED: Now the function moves to the top of the visible screen rather than somewhere in the middle as before. (Thanks D4RKON3)
- ADDED: Open the folder containing the exported file once complete.
- ADDED: Option to add current script to AutoIt's include folder. Ideal if downloading custom UDFs from the forum. (Thanks Ray)
- ADDED: Option to dock the SciTE Jump GUI to the right side of SciTE. Selecting the dock button again will reset the windows to their last position. (Thanks UEZ)
- ADDED: Remembering the last function selected per tab and scrolling to it when re-visiting that particular tab.
- ADDED: 'Replace in Scripts' feature, now you can replace a word or sentence within a directory that contains the supported filetypes i.e. au3, vbs & nsis.
- FIXED: Clearing the search in functions input and line number input when changing files. (Thanks LoWang)
- FIXED: Duplicate folder entries in the combobox. This occurred when dropping the same folder onto the GUI.
- FIXED: Issue when searching for a function with all folds toggled to collapsed would cause random folds to expand whilst searching.
- FIXED: Issue with the Help file not loading correctly.
- FIXED: Now autosaves the current file when restarting from SciTE Jump.
- FIXED: Regression that occurred back in V1.12.35.37 when the sorting function was improved. Now additional information is exported as was the case in V1.11.32.31.
- IMPROVED: Disable the export contextmenu when the file isn't supported by SciTE Jump.
- IMPROVED: Re-arranged order of settings menu.
- IMPROVED: Toggling of folds for functions.

Version 1.13.36.40 [07-04-2012]
- ADDED: Automatically convert the INI file if currently not unicode.
- FIXED: Issue where the height of the taskbar was fixed at 30px rather than finding the working area when checking if the GUI was on the screen.
- FIXED: SciTE Jump not loading the correct help file when entering F1.
- IMPROVED: INI file is now encoded as a unicode file if it doesn't exist already.

Version 1.12.35.37 [21-03-2012]
- ADDED: Additional information to the title on whether or not the application is running the x64 version of SciTE Jump.
- ADDED: Cue banners to the search and 'find in files' input boxes.
- FIXED: Clearing the search in functions input when changing files. (Thanks LoWang)
- FIXED: Incorrect CRC32 value being created. (Thanks JFX)
- FIXED: Issue where functions wouldn't be sorted on first run if enabled.
- FIXED: Missing '$' in the export function list for Global variables.
- IMPROVED: Overall memory consumption and CPU usage.
- IMPROVED: Speed of sorting the function list, now uses sort.exe instead.

Version 1.11.32.31 [08-03-2012]
- ADDED: Additional information when creating a function list, these include Local & Global variables as well as include files being used. (Thanks to Xenobiologist & James1337)
- ADDED: CRC32 (by trancexx) hash to the function list for checking the integrity of your scripts.
- ADDED: Dropping an au3 file onto the SciTE Jump UI, will open the file in SciTE.
- ADDED: Export options to the right-click menu.
- ADDED: HelpFile.chm which gives an overview of SciTE Jump.
- ADDED: Option in the right-click menu to retrieve the function so it can be added as a snippet.
- ADDED: Option in the right-click menu to toggle the fold of the function.
- ADDED: Support for parsing 'Functions' used in NSIS scripts and VBScripts.
- FIXED: When searching within files and then searching through the list would hide the treeview if the value was blank.
- IMPROVED: Asking whether or not to upgrade a previously installed SciTE Jump, now it will only ask you once.
- REMOVED: Invalid contextmenu items when using the 'finding in files' option.

Version 1.10.26.29 [01-02-2012]
- ADDED: SciTE Jump help section to the settings menu, which can be accessed by selecting the titlebar icon.
- ADDED: Shortcut F1 to access the SciTE Jump help section.
- FIXED: Automatically updating SciTE Jump if already installed in the SciTE folder.
- FIXED: Issue where the function list was incorrectly being saved to the SciTE Jump folder.
- UPDATED: Reporting functions and regions when there weren't any to report.

Version 1.9.24.26 [31-01-2012]
- ADDED: Creating a function header via the right-click contextmenu.
- ADDED: Refreshing the function list when changing the option of whether or not to sort functions.
- ADDED: Right-click contextmenu with additional options.
- FIXED: Issue which appeared when I fixed removing the previous keyword for 'searching within files'.
- IMPROVED: The speed of sorting functions.
- UPDATED: Exporting of functions by adding regions as well as header information about the AutoIt script. (Thanks to JohnOne)

Version 1.8.21.23 [11-01-2012]
- ADDED: German translation. (Thanks to burnell)
- ADDED: Sorting of functions, this can be selected by selecting the titlebar icon.
- FIXED: Clearing the 'Find in Files' input when selecting 'Refresh'.
- FIXED: Issue where SciTE Jump would wait indefinitely until the SciTE process existed.

Version 1.7.19.21 [23-12-2011]
- UPDATED: Compiled using the latest version of AutoIt V3.3.8.0.

Version 1.6.19.20 [23-11-2011]
- FIXED: Issue with automatically starting SciTE if not currently running on the system. (Thanks to MvGulik)

Version 1.5.19.19 [22-11-2011]
- FIXED: Issue when searching.
- FIXED: Issue with the refresh button.
- REMOVED: Previous addition of additional 'custom' comments.

Version 1.4.20.17 [16-11-2011]
- ADDED: Additional lookup for the comments ;<plusspace> and ;<minusspace>.
- ADDED: Change the working directory of SciTE to the directory of the file currently being edited.
- ADDED: Exporting to Latex.
- ADDED: GUI out of bounds check (Thanks to wraithdu)
- ADDED: List unused functions in the export functions feature.
- ADDED: Restart option to the system menu for restarting SciTE Jump and SciTE. The session will be resumed once SciTE has succesfully loaded.
- ADDED: Right click selection of an item.
- ADDED: Search within the 'finding in files' results to narrow down the search.
- ADDED: Start SciTE if currently not available. (This works if SciTE Jump has been run once when SciTE was open.)
- ADDED: The ability to cancel when finding text inside files.
- FIXED: GUI would be inactive if started with an empty document in SciTE.
- FIXED: Issue with array out of bounds when nothing was found using _FindInFile.
- IMPROVED: Interaction with SciTE.

Version 1.3.9.15 [02-11-2011]
- ADDED: Dropping a folder onto the GUI to add to the combobox for searching within files.
- ADDED: x64 version of SciTE Jump.
- FIXED: Issue with the SciTE Jump not closing if SciTE was closed and the application was minimised.
- FIXED: Issue with images not showing on the buttons in Windows XP. (Thanks to MvGulik)
- IMPROVED: The finding in files feature, now it won't read the file until the find input box is empty or the refresh button is selected.

Version 1.2.7.11 [10-10-2011]
- FIXED: Issue with the treeview appearing out of bounds when the application was minimised.
- IMPROVED: Source code with the issue fixed above.

Version 1.1.7.9 [08-10-2011]
- ADDED: Update feature, so when you download a new version of SciTE Jump and run the application it will detect if SciTE Jump is on the system and update accordingly. (This does not connect to the Internet.)
- FIXED: Issue with functions not being exported correctly.
- IMPROVED: Checking if using the portable or installed version of AutoIt.
- IMPROVED: Source code with UI tweaks and speed enhancements.

Version 1.0.0.2 [12-08-2011]
- ADDED: HotKey Ctrl + F to set focus to the search input.
- ADDED: Multi-language support with on the fly updating.
- ADDED: Re-sizing of the GUI.
- ADDED: Search within files for a chosen keyword, great if you forget the exact name of a function.
- CHANGED: Name from SciTE Hopper to SciTE Jump.
- IMPROVED: Several UI tweaks.
- IMPROVED: Source code with speed enhancements.
- IMPROVED: The speed of reading a file e.g. a 6005 line file can now be read in 0.09 seconds compared to 0.72 seconds.

Version 1.0.0.1 [14-07-2011]
- ADDED: Bold highlighting of the Function TreeView Item.
- FIXED: Error when SciTE Jump was first loaded with a file that didn't include any Functions.
- FIXED: File not being copied to SciTE directory when 'Added to SciTE.'

Version 1.0.0.0 [03-07-2011]
- Initial release.

-----------------------------