<div align="center">

  <img src="https://raw.githubusercontent.com/openfishtools/.github/main/profile/assets/projects/cep.svg" width="96" height="96" alt="FishTools" />

  # FishTools

  **After Effects extension panel for motion design, easing curves, and project utilities.**

  [![Version: 1.3.10](https://img.shields.io/badge/version-1.3.10-9DFF00.svg)](changelog.md)
  [![Category: Extension](https://img.shields.io/badge/category-Extension-blue.svg)](#)
  [![License: AGPL-3.0](https://img.shields.io/badge/License-AGPL%203.0-blue.svg)](LICENSE)

</div>

[Bahasa Indonesia](#bahasa-indonesia) • [English](#english)

---

<a name="bahasa-indonesia"></a>

> **Pembaruan lisensi:** mulai dari **v1.3.10**, FishTools dilisensikan di bawah **[GNU AGPLv3](LICENSE)**, bukan lagi MIT. Perangkat lunak bebas & open source dengan perlindungan copyleft (siapapun yang memodifikasi dan mendistribusikan wajib membuka seluruh kode sumbernya). Versi sebelum v1.3.10 tetap MIT. Lihat [Lisensi](#lisensi).

## Fitur

### Graph Editor & Easing
- Pengaturan handle kurva bezier secara interaktif.
- Preset easing yang langsung diterapkan, dengan toggle auto-apply.

### Konverter AE ke AM
- Mengubah komposisi After Effects menjadi scene XML Alight Motion.
- Embedding pre-composition secara rekursif dan ekstraksi data keyframe.
- Opsi expression baking dan penyaringan adjustment layer.

### Sistem Auto Save
- Backup proyek otomatis di latar belakang ke folder penyimpanan khusus (`com.cutefish.tools/Auto Save`).
- Penyimpanan di latar belakang tanpa mengganggu, dengan format nama berstempel waktu: `NamaProyek [HH.MM.SS] [DD-MM-YYYY].aep`.

### Utilitas Layer & Transform
- Grid perataan anchor point yang cepat.
- Auto-crop pre-composition yang pintar.
- Pengubah rasio comp dan format FPS.
- Alat duplikasi, crop, overlap, dan screenshot layer.

### Preset Text Animator
- Preset animasi teks kustom dan alat penghapus animator sekali klik.

---

## Instalasi

### Metode 1: Installer Otomatis (Disarankan)
Unduh rilis terbaru dari halaman [GitHub Releases](https://github.com/cutefishaep/OpenFishTools/releases):
- **macOS**: Jalankan `OpenFishTools.pkg` dan ikuti wizard instalasi.
- **Windows**: Jalankan `OpenFishTools_Setup.exe` dan selesaikan instalasi.

*Catatan:* Installer otomatis mengatur pengaturan registry/plist `PlayerDebugMode` yang dibutuhkan ekstensi CEP.

### Metode 2: Instalasi Manual
1. Unduh atau clone repositori ini.
2. Pindahkan direktori `OpenFishTools` ke folder ekstensi CEP di sistemmu:
   - **macOS**: `/Library/Application Support/Adobe/CEP/extensions/`
   - **Windows**: `C:\Program Files (x86)\Common Files\Adobe\CEP\extensions\`
3. Aktifkan `PlayerDebugMode` untuk ekstensi yang tidak ditandatangani:
   - **macOS**: `defaults write com.adobe.CSXS.12 PlayerDebugMode 1`
   - **Windows Registry**: `HKCU\Software\Adobe\CSXS.12` -> `PlayerDebugMode = "1"` (string).
4. Buka After Effects, lalu pilih **Window > Extensions > Fish Tools**.

---

## Prasyarat

Aktifkan **Allow Scripts to Write Files and Access Network** di pengaturan After Effects:
- **After Effects**: `Preferences > Scripting & Expressions`

---

## Membangun Installer

### Installer macOS (.pkg)
Kebutuhan: macOS dengan Xcode Command Line Tools (`pkgbuild` dan `productbuild`).

```bash
cd Installer/Mac
chmod +x build_pkg.sh
./build_pkg.sh
```

Hasil build: `Installer/Mac/OpenFishTools.pkg`

### Installer Windows (.exe)
Kebutuhan: Inno Setup 6.x.

Jalankan skrip batch otomatis:
```cmd
cd Installer\Windows
build.bat
```

Atau compile manual `Installer\Windows\OpenFishTools_Setup.iss` di Inno Setup Compiler.

Hasil build: `Installer/Windows/OpenFishTools_Setup.exe`

---

## Lisensi
 
Proyek ini dilisensikan di bawah [GNU Affero General Public License v3 (AGPL-3.0)](LICENSE). Halaman resmi: <https://www.gnu.org/licenses/agpl-3.0.html>.

### Ringkasan
| B/T | Keterangan |
|---|---|
| Boleh | Memakai, memodifikasi, dan membagikan secara bebas (termasuk untuk keperluan pribadi maupun komersial). |
| Boleh | Membuat versi modifikasi (fork) dan mengintegrasikannya. |
| Wajib | **Membuka Source Code (Copyleft):** Jika Anda memodifikasi atau mendistribusikan software ini, Anda **wajib** merilis seluruh kode sumber modifikasinya ke publik di bawah lisensi AGPLv3 juga. |
| Wajib | Mencantumkan kredit dan pemberitahuan hak cipta asli ke FishTools (OpenFishTools). |
| Wajib | Membagikan versi modifikasi dengan lisensi yang sama persis (AGPL-3.0). |
| Tidak | Menutup source code (*closed source*) saat mendistribusikan atau menjalankannya ke pengguna lain. |
| Tidak | Menghapus atribusi/kredit asli atau membatasi hak kebebasan pengguna lain. |
| Tidak | Menuntut pembuat bertanggung jawab. Diberikan apa adanya, tanpa jaminan. |

Teks yang mengikat secara hukum adalah file [`LICENSE`](LICENSE); ringkasan ini hanya sebagai bantuan penjelasan.

## Disclaimer

OpenFishTools adalah ekstensi independen. Adobe dan After Effects adalah merek dagang terdaftar milik Adobe Inc. OpenFishTools tidak berafiliasi, tidak didukung, dan tidak disponsori oleh Adobe Inc.

---

<a name="english"></a>

> **License update:** starting from **v1.3.10**, FishTools is licensed under **[GNU AGPLv3](LICENSE)** instead of MIT. Free and open-source software protected by copyleft (anyone who modifies and distributes it must release the complete source code). Versions before v1.3.10 stay under MIT. See [License](#license).

## Features

### Graph Editor & Easing
- Interactive bezier curve handle adjustments.
- Easing presets with instant application and auto-apply toggles.

### AE to AM Converter
- Converts After Effects compositions into Alight Motion XML scenes.
- Recursive pre-composition embedding and keyframe data extraction.
- Optional expression baking and adjustment layer filtering options.

### Auto Save System
- Automatic background project backup into designated storage folders (`com.cutefish.tools/Auto Save`).
- Non-disruptive background saving with timestamped file naming formats: `ProjectName [HH.MM.SS] [DD-MM-YYYY].aep`.

### Layer & Transform Utilities
- Quick anchor point alignment grid.
- Smart auto-crop pre-compositions.
- Comp ratio and FPS format changers.
- Layer duplication, cropping, overlap, and screenshot tools.

### Text Animator Presets
- Custom text animation presets and one-click animator clearing tools.

---

## Installation

### Method 1: Automated Installer (Recommended)
Download the latest release from the [GitHub Releases](https://github.com/cutefishaep/OpenFishTools/releases) page:
- **macOS**: Run `OpenFishTools.pkg` and follow the setup wizard.
- **Windows**: Run `OpenFishTools_Setup.exe` and complete installation.

*Note:* Automated installers automatically configure `PlayerDebugMode` registry/plist settings required for CEP extensions.

### Method 2: Manual Installation
1. Download or clone this repository.
2. Move the `OpenFishTools` directory into your system's CEP extensions folder:
   - **macOS**: `/Library/Application Support/Adobe/CEP/extensions/`
   - **Windows**: `C:\Program Files (x86)\Common Files\Adobe\CEP\extensions\`
3. Enable `PlayerDebugMode` for unsigned extensions:
   - **macOS**: `defaults write com.adobe.CSXS.12 PlayerDebugMode 1`
   - **Windows Registry**: `HKCU\Software\Adobe\CSXS.12` -> `PlayerDebugMode = "1"` (string).
4. Launch After Effects and navigate to **Window > Extensions > Fish Tools**.

---

## Prerequisites

Enable **Allow Scripts to Write Files and Access Network** under After Effects Preferences:
- **After Effects**: `Preferences > Scripting & Expressions`

---

## Building Installers

### macOS Installer (.pkg)
Requirements: macOS with Xcode Command Line Tools (`pkgbuild` and `productbuild`).

```bash
cd Installer/Mac
chmod +x build_pkg.sh
./build_pkg.sh
```

Output binary: `Installer/Mac/OpenFishTools.pkg`

### Windows Installer (.exe)
Requirements: Inno Setup 6.x.

Run the automated batch script:
```cmd
cd Installer\Windows
build.bat
```

Or manually compile `Installer\Windows\OpenFishTools_Setup.iss` inside Inno Setup Compiler.

Output binary: `Installer/Windows/OpenFishTools_Setup.exe`

---

## License

This project is licensed under the [GNU Affero General Public License v3 (AGPL-3.0)](LICENSE). Official page: <https://www.gnu.org/licenses/agpl-3.0.html>.

### Summary
| Y/N | Description |
|---|---|
| Yes | Use, modify and share freely (including for personal and commercial purposes). |
| Yes | Make modified versions (forks) and integrate them. |
| Required | **Disclose Source Code (Copyleft):** If you modify or distribute this software, you **must** make the complete source code of your version available under the AGPLv3. |
| Required | Keep the original copyright notices and credit to FishTools (OpenFishTools). |
| Required | Share any modified versions under the same AGPL-3.0 license. |
| No | Make the software closed-source when distributing it to other users. |
| No | Remove original credits or restrict other users' freedoms. |
| No | Hold the authors liable. It is provided as is, without warranty. |

The legally binding text is the [`LICENSE`](LICENSE) file; this summary is for informational purposes only.

## Disclaimer

OpenFishTools is an independent extension. Adobe and After Effects are registered trademarks of Adobe Inc. OpenFishTools is not affiliated with, endorsed by, or sponsored by Adobe Inc.
