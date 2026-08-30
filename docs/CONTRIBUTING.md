# Contributing Guide — One vs Many

Dokumen ini menjadi standar kontribusi untuk seluruh anggota project **One vs Many**.

Tujuannya supaya workflow GitHub tetap rapi, mudah direview, dan mengurangi konflik saat development.

---

# 1. Branch Structure

Gunakan struktur berikut:

```text
main
└── develop
    └── feature/*
```

### `main`

Berisi versi game yang stabil atau siap dirilis.

Jangan melakukan development langsung di branch ini.

### `develop`

Tempat integrasi semua feature sebelum masuk ke `main`.

Feature harus di-merge ke `develop` terlebih dahulu.

### Feature Branch

Setiap feature dibuat di branch terpisah.

Contoh:

```text
feature/player-movement
feature/enemy-chase
feature/combat
feature/xp-system
feature/ui
```

Untuk bug:

```text
fix/projectile-collision
fix/enemy-spawn
```

Untuk dokumentasi:

```text
docs/setup-guide
```

Untuk refactor:

```text
refactor/combat-system
```

---

# 2. Sebelum Mulai Mengerjakan Feature

Pastikan `develop` terbaru.

```bash
git checkout develop
git pull origin develop
```

Kemudian masuk ke branch feature yang akan dikerjakan.

Contoh:

```bash
git checkout feature/player-movement
```

Jika membuat branch baru:

```bash
git checkout -b feature/player-dash
git push -u origin feature/player-dash
```

---

# 3. Commit Convention

Project menggunakan format:

```text
type(scope): description
```

Contoh:

```text
feat(player): add basic movement
fix(enemy): prevent spawning inside player
refactor(combat): simplify projectile logic
docs(project): update contribution guide
chore(project): update gitignore
```

## Allowed Types

```text
feat      = fitur baru
fix       = perbaikan bug
refactor  = perubahan struktur kode tanpa mengubah behavior utama
docs      = dokumentasi
style     = perubahan visual atau formatting
test      = testing
chore     = konfigurasi atau maintenance
perf      = optimasi performa
```

## Common Scopes

```text
player
enemy
combat
spawner
progression
upgrade
ui
audio
art
game
project
```

---

# 4. Commit Rules

Gunakan bahasa Inggris.

Gunakan deskripsi singkat dan jelas.

Gunakan kata kerja seperti:

```text
add
fix
update
remove
refactor
prevent
implement
```

Contoh yang benar:

```text
feat(player): add movement speed
feat(enemy): add chase behavior
fix(combat): prevent projectile double hit
```

Hindari:

```text
update
fix
done
final
final2
coba
revisi
asdf
```

Satu commit idealnya mewakili satu perubahan logis.

---

# 5. Sebelum Commit

Selalu cek perubahan terlebih dahulu.

```bash
git status
git diff
```

Tambahkan file yang memang berhubungan dengan perubahan.

Contoh:

```bash
git add scripts/player/player.gd
git add scenes/player/player.tscn
```

Kemudian:

```bash
git commit -m "feat(player): add basic movement"
git push
```

---

# 6. Pull Request Workflow

Feature branch tidak langsung masuk ke `main`.

Workflow:

```text
feature/*
    ↓
Pull Request
    ↓
develop
    ↓
testing
    ↓
Pull Request
    ↓
main
```

Minimal satu anggota lain harus melakukan review sebelum merge jika memungkinkan.

---

# 7. Pull Request Title

Gunakan format:

```text
type: short description
```

Contoh:

```text
feat: implement player movement
feat: add enemy spawning system
fix: prevent duplicate projectile damage
docs: add setup instructions
```

---

# 8. Pull Request Description

Setiap Pull Request harus menggunakan format berikut:

```markdown
## Summary

Jelaskan secara singkat apa yang dikerjakan dalam PR ini.

## Changes

- Perubahan pertama
- Perubahan kedua
- Perubahan ketiga

## How to Test

Jelaskan bagaimana reviewer bisa mengecek feature ini.

Contoh:

1. Jalankan project Godot.
2. Buka scene `arena.tscn`.
3. Jalankan game.
4. Gunakan WASD.
5. Pastikan player dapat bergerak ke semua arah.

## Related Issue

Closes #ISSUE_NUMBER

Jika tidak ada issue:

N/A

## Screenshots / Video

Tambahkan screenshot atau video jika perubahan memiliki efek visual.

Jika tidak:

N/A

## Checklist

- [ ] Project dapat dijalankan tanpa error
- [ ] Feature telah dites
- [ ] Tidak melakukan perubahan yang tidak berhubungan
- [ ] Commit message mengikuti standar project
- [ ] Branch sudah update dengan `develop`
- [ ] Tidak ada file temporary atau debug yang ikut ter-commit
```

---

# 9. Contoh Pull Request

## Title

```text
feat: implement player movement
```

## Description

```markdown
## Summary

Menambahkan basic player movement menggunakan input WASD.

## Changes

- Menambahkan script `player.gd`
- Menambahkan movement speed
- Menambahkan input WASD
- Menambahkan diagonal movement normalization

## How to Test

1. Jalankan project.
2. Buka scene arena.
3. Tekan W, A, S, dan D.
4. Pastikan player bergerak sesuai arah input.
5. Tekan W + D.
6. Pastikan diagonal movement tidak lebih cepat.

## Related Issue

Closes #3

## Screenshots / Video

N/A

## Checklist

- [x] Project dapat dijalankan tanpa error
- [x] Feature telah dites
- [x] Tidak melakukan perubahan yang tidak berhubungan
- [x] Commit message mengikuti standar project
- [x] Branch sudah update dengan `develop`
- [x] Tidak ada file temporary atau debug yang ikut ter-commit
```

---

# 10. Updating Branch Before Pull Request

Sebelum membuat PR, update branch dengan perubahan terbaru dari `develop`.

```bash
git checkout develop
git pull origin develop
```

Kemudian kembali ke feature:

```bash
git checkout feature/player-movement
git merge develop
```

Jika ada conflict, selesaikan conflict terlebih dahulu.

Setelah selesai:

```bash
git push
```

Baru buat Pull Request.

---

# 11. Merge Rules

Jangan merge jika:

```text
Project error
Feature belum dites
Ada merge conflict
PR tidak memiliki deskripsi
Perubahan terlalu banyak dan tidak berkaitan
```

Merge hanya jika feature sudah cukup stabil.

---

# 12. Delete Completed Branch

Setelah PR berhasil di-merge, feature branch boleh dihapus.

Contoh:

```bash
git branch -d feature/player-movement
git push origin --delete feature/player-movement
```

Jangan gunakan kembali branch lama untuk feature baru.

Buat branch baru.

---

# 13. General Rule

Prioritas project:

```text
Working
↓
Playable
↓
Stable
↓
Fun
↓
Polished
↓
More Features
```

Jangan mengorbankan kestabilan project hanya untuk menambah banyak feature.

Setiap anggota bertanggung jawab menjaga branch mereka tetap jelas, teruji, dan mudah direview.
