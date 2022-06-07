# Laboratorium Administracji Systemów Komputerowych

## Windows Subsystem for Linux (WSL)

@TODO Wstęp

## Zadania do wykonania

### ___Zadanie 1___: Zainstaluj WSL na Windows 10

1. Zainstaluj *Windows Terminal Preview*, *Visual Studio Code* oraz *Ubuntu 22.04 LTS* z **Microsoft Store**.
1. Podczas instalacji Ubuntu ustaw użytkownika student/student
1. Ustaw dystrybucje Ubuntu jako domyślną
1. Otwórz zakładkę PowerShell w Windows Terminal
    ```
    > wsl --set-default Ubuntu
    ```
1. Ustaw wersję WSL na 2 dla Ubuntu:
    ```
    > wsl --set-version Ubuntu 2
    ```
1. Potwierdź wykonanie zadania

    ```
    > wsl --list --verbose
      NAME                   STATE           VERSION
    * Ubuntu                 Running         2
    ```
1. Zamknij zakładkę PowerShell

### ___Zadanie 2___: Zainstaluj *Docker Desktop* dla Windows

1. Pobierz instalator z

    https://docs.docker.com/desktop/windows/install/

1. Zainstaluj Docker Desktop Installer.exe
1. Zrestartuj PC
1. Uruchom *Docker Desktop*
1. Skonfiguruj tak by używał backendu WSL
    ```
    Settings/General:

    [X] Use the WSL 2 based engine

    WSL 2 provides better performance than the legacy Hyper-V backend. Learn more.
    ```
    ```
    Resources/WSL integration:

    Configure which WSL 2 distros you want to access Docker from.

    [X] Enable integration with my default WSL distro

    Enable integration with additional distros:
    [X] Ubuntu
    ```

### ___Zadanie 3___: Sklonuj kontener z GitLab

1. Otwórz zakładkę Ubuntu w Windows Terminal
    ```
    Welcome to Ubuntu 22.04 LTS (GNU/Linux 5.11.102.1-microsoft-standard-WSL2 x86_64)

    * Documentation:  https://help.ubuntu.com
    * Management:     https://landscape.canonical.com
    * Support:        https://ubuntu.com/advantage

    System information as of Mon Jun  6 22:02:55 CEST 2022

    System load:  1.15               Processes:             31
    Usage of /:   1.9% of 251.98GB   Users logged in:       0
    Memory usage: 55%                IPv4 address for eth0: 172.27.189.246
    Swap usage:   0%


    0 updates can be applied immediately.
    $
    ```
1. Zainstaluj niezbędne do dalszej części laboratorium narzędzia

    ```
    $ sudo apt update
    ```
    ```
    $ sudo apt install g++ cmake ninja-build
    ```

1. Pobierz kontener z GitLab (ponad 1GB)
    ```
    $ docker run --detach \
        --env GITLAB_HOME=/srv/gitlab \
        --hostname localhost \
        --publish 22:22 --publish 443:443 --publish 80:80 \
        --name gitlab \
        --restart always \
        --shm-size 256m \
        gitlab/gitlab-ee:latest
    ```
1. Skonfiguruj usługę GitLab

    W aplikacji *Docker Desktop* wybierz zakładkę *Containers*:
   - W kontenerze *gitlab/gitlab-ee:latest*: Open with browser...
   - Poczekaj aż wystartuje usługa GitLab
   
     ![GitLab](./res/gitlab.png)

   - Otwórz terminal z kontenera: Open in terminal...

    ```
    # bash
    root@localhost:/# grep Password: /etc/gitlab/initial_root_password
    Password: your_very_long_secret_root_password_here
    ```
  - Skopiuj hasło do schowka
  - Zaloguj się do GitLab na użytkownika *root* przy użyciu tego hasła (zapamiętaj je w przeglądarce)
  - Zamknij terminal z wnętrza kontenera gitlab
  - W panelu administracyjnym GitLab Admin stwórz 3 użytkowników:
    - ASK Lab Student/student/student123/student@polsl.pl/Regular
    - ASK Lab Assistant/assistant/assistant123/assistant@polsl.pl/Regular
    - ASK Lab Docent/docent/docent123/docent@polsl.pl/Administrator
  - Zaloguj sie na nowo stworzonego użytkownika *student* i ustaw nowe hasło: asklabstudent   
  - Stwórz nowy projekt: my-awsome-project
  - Dodaj do projektu użytkowników *assistant* i *docent*
    (Project information/Members)

1. Wygeneruj parę kluczy SSH bez hasła

    ```
    $ ssh-keygen -t ed25519
    Generating public/private ed25519 key pair.
    Enter file in which to save the key (/home/student/.ssh/id_ed25519):
    Created directory '/home/student/.ssh'.
    Enter passphrase (empty for no passphrase):
    Enter same passphrase again:
    Your identification has been saved in /home/student/.ssh/id_ed25519
    Your public key has been saved in /home/student/.ssh/id_ed25519.pub
    The key fingerprint is:
    SHA256:536AVkrt2h93HzJNtbe47unaieudKkl8UXa2CjH01sk student@localhost
    The key's randomart image is:
    +--[ED25519 256]--+
    |          ..     |
    |           o.ooo.|
    |         .  =ooEo|
    |        . oo.  .o|
    |       .S=. o .o.|
    |        +=o. .+ o|
    |       ..o+..+.+.|
    |        .+. =oB.o|
    |          +OO@  .|
    +----[SHA256]-----+

    $ cat ~/.ssh/id_ed25519.pub
    ssh-ed25519 ...
    ```

1. Wgraj klucz publiczny na server GitLab dla użytkownika student

    - Skopiuj do schowka linijkę z kluczem (wynik działania poprzedniej komendy).
    - W prawym górnym rogu na avatarze: Edit profile/SSH keys (http://localhost/-/profile/keys)
    - Wklej zawartość schowka do pola Key i dodaj klucz: Add key
    - Dodany klucz SSH do profilu w GitLab

      ![SshKey](./res/ssh_key.png)

### ___Zadanie 4___: Zainstaluj pomocne rozszerzenia Visual Studio Code (Ctrl-Shift-X)

- Remote - WSL
- C/C++
- CMake
- CMake Tools
- GitLab Workflow










