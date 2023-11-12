# Navigating Linux with Basic Commands

[中文版本 | Chinese Version](./README-CN.md)

Using the Linux command line, or bash, can feel like navigating a maze at first. However, with practice, it becomes second nature. Let’s go through some basic commands with examples to get you started.

## The Commands

1. **`cd`**

    The `cd` command allows you to move between directories. Here are some examples:

    **Moving Up One Directory**:
    If you're in `/home/username/Documents` and want to go back to `/home/username`, you can use:

    ```bash
    cd ..
    ```

    This command moves you up one level in the directory hierarchy.

    **Going to the Home Directory**:
    To quickly return to your home directory from anywhere, just type:

    ```bash
    cd
    ```

    Or:

    ```bash
    cd ~
    ```

    **Moving Up Multiple Levels**:
    Suppose you're in `/home/username/Documents/2020/Reports` and want to go back to `/home/username`. You can chain the `..` together with slashes:

    ```bash
    cd ../../..
    ```

    **Absolute Path vs. Relative Path**:
    If you want to move to a specific directory regardless of your current location, you can use an absolute path, which starts with `/`:

    ```bash
    cd /var/www/html
    ```

    If you want to move to a directory relative to your current location, you don't start with `/`. For example, if you're in `/var` and want to move to `/var/www`, you can use:

    ```bash
    cd www
    ```

2. **`pwd`**:
   To find out where you are, type:

   ```bash
   pwd
   ```

   This will print the full path to your current directory.

3. **`ls`**:
   To list all files and directories in your current directory:

   ```bash
   ls
   ```

   To list all files, including hidden ones, and their details like permissions, size, and modification date:

   ```bash
   ls -la
   ```

4. **`cp`**:
   To copy a file from your current directory to another:

   ```bash
   cp myfile.txt /home/username/backup/myfile.txt
   ```

   To copy a directory and all its contents:

   ```bash
   cp -r /home/username/myfolder /home/username/backup/myfolder
   ```

5. **`rm`**:
   To remove a single file:

   ```bash
   rm myfile.txt
   ```

   To remove a directory and all of its contents:

   ```bash
   rm -r myfolder
   ```

6. **`mkdir`**:
   To create a new directory:

   ```bash
   mkdir newfolder
   ```

   To create a directory within a directory, even if the parent doesn't exist (using the `-p` option):

   ```bash
   mkdir -p newfolder/subfolder
   ```

7. **`cat`**:
   To display the contents of a file:

   ```bash
   cat myfile.txt
   ```

8. **`nano`**:
   To edit a file or create a new one if it doesn't exist:

   ```bash
   nano myfile.txt
   ```

9. **`touch`**:
   To create a new, empty file:

   ```bash
   touch newfile.txt
   ```

   Or to update the timestamp of an existing file:

   ```bash
   touch existingfile.txt
   ```

Remember that the command line is very literal; it does exactly what you tell it to. Always double-check your commands before executing, especially when using `rm`, as it can lead to data loss if used improperly. With practice, you'll find the command line to be a fast and efficient way to work on your computer.
