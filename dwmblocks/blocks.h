//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
  {"| ", "~/.config/scripts/keyboard.sh", 1, 0},
  {"", "~/.config/scripts/brightness.sh", 2, 0},
  {"", "~/.config/scripts/volume.sh", 2, 0},
  {"", "~/.config/scripts/battery.sh", 10, 0},
  {"", "~/.config/scripts/date.sh", 60, 0},
  {"", "~/.config/scripts/time.sh", 5, 0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 7;
