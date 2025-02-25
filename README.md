# Конфигурация NixOS (v24.11)

Этот конфиг создан исключительно для личного использования. Он может служить примером для создания вашего собственного конфига.

## Обзор системы

- **Устройство:** Ноутбук с графикой Intel и NVIDIA GT 650M.
- **Драйверы:** Использую драйверы NVIDIA версии 470. Поскольку Wayland работает нестабильно с NVIDIA, я использую Xorg, а именно оконный менеджер **Qtile**.
- **DPI:** Для X-сервера зафиксирован DPI на уровне 92.
- **Менеджер входа:** SDDM с темой *Astronaut*.
- **Bluetooth:** Ноутбук поддерживает Bluetooth, однако для моей модели NixOS подбирает некорректные драйверы, поэтому используется опция `enableAllFirmware`.

## Файловая система

1. **FAT32 раздел** (0.5 GB) для GRUB.
2. **ext4 раздел** (109 GB) для root. В директории `/home` также смонтирован дополнительный диск с проектами и играми.
3. **Swap раздел** (9 GB).

## Программное обеспечение и инструменты

- **Языки программирования:** Python, Rust и Node.js (с дополнительными пакетами).
- **Утилиты:** В основном использую `doas`, но оставляю `sudo` на всякий случай.
- **Очистка системы:** Автоматическое удаление пакетов и поколений NixOS (ежедневная проверка, удаляющая поколения старше двух дней).
- **Микрокод:** Установлен пакет `ucode-intel`.
- **Локализация:** Турецкое время и английский язык.
- **Сеть:** Использую NetworkManager.
- **Игры:** Изредка играю в Minecraft с использованием Prism Launcher.
- **Аудио:** Pipewire.
- **Удалённый доступ:** SSH для подключения к компьютеру.
- **Редакторы кода:** VSCode для разработки и nano для небольших задач.
- **Терминал и оболочка:** Терминал Alacritty — мне понравился его внешний вид "из коробки", а также оболочка zsh (иногда с tmux).
- **Прочее:** Transmission для скачивания торрент-файлов и Lutris для запуска игр.
- **Браузеры:** Chrome и Firefox.

---

# NixOS Configuration (v24.11)

This configuration was created solely for my personal use. It can serve as an example for creating your own configuration.

## System Overview

- **Device:** Laptop with Intel graphics and NVIDIA GT 650M.
- **Drivers:** Using NVIDIA drivers version 470. Since Wayland is unstable with NVIDIA, I use Xorg, specifically the **Qtile** window manager.
- **DPI:** The X server DPI is fixed at 92.
- **Display Manager:** SDDM with the *Astronaut* theme.
- **Bluetooth:** Although my laptop supports Bluetooth, NixOS selects incorrect drivers for my model, so I had to enable the `enableAllFirmware` option.

## File System

1. **FAT32 partition** (0.5 GB) for GRUB.
2. **ext4 partition** (109 GB) for root. Additionally, a separate disk with projects and games is mounted in the user's `/home` directory.
3. **Swap partition** (9 GB).

## Software and Tools

- **Programming Languages:** Python, Rust, and Node.js (with additional packages).
- **Utilities:** I mainly use `doas`, but I keep `sudo` as a fallback.
- **System Cleanup:** Automatic removal of packages and NixOS generations (a daily check deletes generations older than two days).
- **Microcode:** Installed `ucode-intel`.
- **Localization:** Turkish time zone and English language.
- **Network:** Using NetworkManager.
- **Gaming:** Occasionally play Minecraft using Prism Launcher.
- **Audio:** Pipewire.
- **Remote Access:** SSH for connecting to the computer remotely.
- **Code Editors:** VSCode for development and nano as a lightweight editor.
- **Terminal and Shell:** Alacritty for its attractive out-of-the-box appearance and zsh as my shell (occasionally using tmux).
- **Others:** Transmission for torrent downloads and Lutris for launching games.
- **Browsers:** Chrome and Firefox.


<br>

### Translated and improved my text gpt chat 4o + deep think.
*I didn't even read what he wrote*
