# Android Development

- AVD: Android Virtual Device
- ADB: Android Development Bridge
  - adb devices
  - adb kill-server
  - adb start-server
  - adb shell
  - adb logcat
    - adb -e logcat -b events
- DDMS:
  - Process-oriented
    - Memory usage
      - Heap viewer tab
      - Allocation tracker tab
    - Thread activity
      - Thread tab
    - Network activity
      - Network statistics tab
  - Device/AVD-oriented
    - Access device/AVD file system
      - File explorer tab
    - Screen capture
    - AVD control
      - Emulator management
  - Even more
- aapt (Android Asset Packaging Tool) will create .java files from the resource files.
- Java compiler creates .class files from source .java files.
- Dalvik Executable Tool creates .dex files from the .class files.
- apk builder hook the compiled resources, the .dex files into a .apk file.

## Useful things

- Every activity should be added in the manifest file.
- Use onOptionItemSelected in the Activity class to handle the menu click.
- Use the method finally() to close the Activity.
- In the onCreate method use the setContentView(R.layout.xxx) to set the layout for the activity.
- startActivity() is used to open an activity.
- We have 3 options to create the OnClick
  - implements The View.OnClickListener and @Override the onClick method.
  - Creates an anonymous inner class inside of the Button.setOnClickListener (eg. myButton.setOnClickListener(new View.OnClickListener() { ... });
  - Use a lambda expression (requires Java 8) (eg. myButton.setOnClickListener((view) -> { ... });
- [display activities]
  - Intent i = new Intent(this, MyNextActivity.class); startActivity(i);
  - Intent i = new Intent(this, MyNextActivity.class); startActivityForResult(i, requestCode);
    - Create an empty intent. eg. Intent i - new Intent();
    - Put the result values as extras. eg. i.putExtra("ExtraName", extraValue);
    - setResult(resultCodeValue, i);
    - @Override the onActivityResult method in the caller class.
- The provide "parameters" to an intent we can use extras.
- EditText important properties
  - inputType
  - hint

## Java vs .net

| Java            | .net              |
|-----------------|-------------------|
| package         | namespace         |
| import          | using             |
| extends         | :                 |
| @               | []                |
| super           | base              |
| MyClass.class   | MyClass.GetType() |
| //<editor-fold> | #region           |

## Android vs Windows Forms

| Android   | Windows Forms |
|-----------|---------------|
| Activity  | Form          |
| View      | Control       |
| Fragments | User Control  |

## Android Studio vs Visual Studio shortcut

| Description          | Android Studio       | Visual Studio |
|----------------------|----------------------|---------------|
| Quick Actions        | Alt + Enter          | Alt + .       |
| Duplicate selection  | Alt + D              |               |
| Finish line          | Ctrl + Shift + Enter |               |
| Run                  | Shift + F10          | F5            |

## Pending

- Load states
- Event handlers
- Localization
