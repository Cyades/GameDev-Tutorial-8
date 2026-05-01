# 🎮 Game Development Tutorial 8
*Nama:** Malvin Scafi  
**NPM:** 2306152430  
**Kelas:** Game Development

## Tutorial 8

Spawn Rate jadi diganti jadi 1.5 agar karakter bisa lewat.

## Fitur Tambahan 

### 1. Sistem Nyawa
- Pemain sekarang memiliki atribut nyawa yang dimulai dengan 3
- Saat pemain bertabrakan dengan tikus, nyawa akan berkurang 1

### 2. UI / HUD Nyawa
- Terdapat penambahan Node `CanvasLayer` dan `MarginContainer` di dalam `Player.tscn` agar selalu berada di posisi layar.
- Ditampilkan tulisan indikator Nyawa berwarna merah yang otomatis terupdate ketika terkena musuh.

### 3. Layar Game Over & Restart
- Kalau nyawa 0, karakter akan ke Game Over Screen (`Game Over.tscn`).
- Ada layar antarmuka berisi teks peringatan "GAME OVER" dan juga tombol "Main Lagi".
- Mengklik tombol "Main Lagi" akan kembali ke `Level 1.tscn` dan nilai nyawa kembali ke awal.