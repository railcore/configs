# Macros directory

## Setting macro files for common tasks overview

You can use macro files to automate common tasks. A macro file is simply a text file on the SD card containing a sequence of GCode commands.

If you want a macro file to appear in the list of macros shown by Duet Web Control and PanelDue, put it in the /macros folder of the SD card.

### Creating macros

You can create macros easily in Duet Web Control. To create a new macro file in the /macros folder, go to the **Macros** page of Duet Web Control and click on **Make new**. To create a new macro file in the /sys folder, go to the **Settings** page, then the **System Editor** tab, and click on **New File**.
Naming and ordering macros

The name of a macro file in the /macros folder should be the text that you want to appear in the macro lists shown by Duet Web Control and PanelDue.

By default the macros are listed in alphabetical order. You can change this by prefixing the macro names with one or more decimal digits followed by an underscore, for example:

1_Off
\
2_Half On
\
3_On

The full filename will be used when the macros are sorted to display them in order, but only the text after the underscore will be displayed on the button. So the above will display as:

Off
\
Half On
\
On

Note: versions of PanelDue prior to 1.20beta2 do not implement this feature.
