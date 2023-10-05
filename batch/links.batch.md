# Batch: Links

- Symbolic Link

  ```cmd
  mklink SymbolicLinkPath TargetPath
  mklink /D SymbolicLinkPath TargetPath
  ```

- Hard Link: A hard link is the file-system representation of a file by which more than one path references a single file in the same volume.

  ```cmd
  mklink /H HardLinkPath TargetPath
  ```

- Junction: A junction (also called a soft link) differs from a hard link in that the storage objects it references are separate directories. A junction can also link directories located on different local volumes on the same computer. Otherwise, junctions operate identically to hard links.

  ```cmd
  mklink /J JunctionLinkPath TargetPath
  ```

## More Information

- [Creating Symbolic Links](https://learn.microsoft.com/en-us/windows/win32/fileio/creating-symbolic-links)
- [Hard links and junctions](https://learn.microsoft.com/en-us/windows/win32/fileio/hard-links-and-junctions)
- [The Complete Guide to Creating Symbolic Links (aka Symlinks) on Windows](https://www.howtogeek.com/howto/16226/complete-guide-to-symbolic-links-symlinks-on-windows-or-linux/)
