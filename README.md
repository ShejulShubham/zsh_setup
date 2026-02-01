## **Zsh + Plugin Environment Pre-Setup Note**

Before using the `.zshrc` configuration I gave you, make sure the following packages are installed:

### **1. Core Shell**

* **Zsh** (the main shell)

```bash
sudo apt install zsh          # Debian/Ubuntu
sudo dnf install zsh          # Fedora/RHEL
sudo pacman -S zsh            # Arch
```

Make sure you set it as default shell:

```bash
chsh -s $(which zsh)
```

---

### **2. Git** (needed to clone plugins)

```bash
sudo apt install git
sudo dnf install git
sudo pacman -S git
```

---

### **3. fzf** (used for fuzzy completion & preview)

```bash
sudo apt install fzf
sudo dnf install fzf
sudo pacman -S fzf
```

Optional but recommended: run `fzf --zsh` integration after install.

---

### **4. LS\_COLORS Support**

* **coreutils** (already installed on most distros)
* **GNU ls** is required for colored previews.

---

### **5. Fonts for Powerlevel10k**

* Install a Nerd Font (Powerlevel10k needs patched icons)

```bash
# Example: Hack Nerd Font
sudo apt install fonts-hack-ttf        # Ubuntu/Debian
sudo dnf install hack-fonts            # Fedora
sudo pacman -S ttf-hack-nerd            # Arch
```

After installation, select the Nerd Font in your terminal’s settings.

---
