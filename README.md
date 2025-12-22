# 🚀 Spconv Builder & Binary Distribution

**Prebuilt, standalone C++ artifacts for `spconv` — no Python, no pain.**

This repository provides a **fully automated build & release pipeline** that converts
 [`traveller59/spconv`](https://github.com/traveller59/spconv) + [`FindDefinition/cumm`](https://github.com/FindDefinition/cumm)
 into **production-ready C++ headers and shared libraries (`libspconv.so`)**.

Designed for **high-performance inference environments** such as:

- TensorRT custom plugins
- CUDA-native C++ inference engines
- Embedded & autonomous driving platforms (Jetson Orin)

> 💡 **If you’ve ever struggled with “spconv build” — this repo is for you.**

------

## ✨ Why This Exists

`spconv` is an industry-standard sparse convolution library, but:

- ❌ Strongly coupled with Python build/runtime
- ❌ Painful to integrate into **pure C++ inference stacks**
- ❌ Hard to cross-compile for **Jetson / Drive platforms**
- ❌ CI-unfriendly for reproducible builds

**This project solves exactly that.**

------

## 🔑 Key Features

✅ **Standalone C++ Distribution**

- No Python required at runtime or link time
- Clean headers + `libspconv.so`

✅ **Production-Grade Architectures**

- **x86_64**: Data center / workstation GPUs
- **aarch64**: NVIDIA Jetson AGX Orin / OrinX

✅ **Inference-Oriented Build**

- Optimized for TensorRT plugin integration
- Suitable for custom CUDA operators

✅ **Fully Automated CI**

- GitHub Actions builds & publishes binaries
- Versioned, reproducible, downloadable artifacts

✅ **Flattened Header Layout**

- `spconv`, `cumm`, and `tensorview` headers included
- Ready for direct CMake consumption

------

## 📦 Prebuilt Artifacts

All binaries are published on the
 👉 **[Releases Page](https://github.com/SilvesterHsu/spconv-builder/releases)**

### 📁 Package Layout

```
libspconv-{version}-{arch}-cuda{cuda_version}.tar.gz
├── include/
│   ├── spconvlib/
│   │   ├── cumm/        # CUDA MMA & kernel primitives
│   │   └── spconv/      # Sparse convolution core
│   └── tensorview/      # TensorView utilities
└── lib/
    └── libspconv.so     # Shared library
```

------

## 🧩 Typical Use Cases

- 🔌 **TensorRT Plugin Development**
- 🚗 **Autonomous Driving Perception Pipelines**
- ⚡ **Sparse CNN Inference Engines**
- 🧠 **CUDA / HPC Research Projects**
- 📦 **Binary Distribution in CI/CD**

------

## 🛠 Supported Platforms

| Architecture | Platform            | OS                                        | CUDA | Compute Capability |
| ------------ | ------------------- | ----------------------------------------- | ---- | ------------------ |
| **x86_64**   | PC / Server         | Ubuntu 20.04                              | 11.8 | 8.0 / 8.6 / 8.9    |
| **aarch64**  | Jetson Orin / OrinX | Ubuntu 20.04 (JetPack 5.x / DriveOS 6.0+) | 11.4 | 8.7                |

> ⚠️ Other CUDA / OS versions may work but are **not officially validated**.

------

## 🧠 Design Philosophy

- **Inference-first**, not training
- **C++ native**, not Python-bound
- **Reproducible builds**, not local hacks
- **CI-driven**, not manual compilation

------

## 📜 License & Acknowledgements

This repository **does not modify the original algorithms**.

- **Build & CI Scripts**: MIT License
- **spconv**: Apache 2.0 — [traveller59](https://github.com/traveller59/spconv)
- **cumm**: Apache 2.0 — [FindDefinition](https://github.com/FindDefinition/cumm)

🙏 Full credit to the original authors.

If you use this in research or production, please cite the original `spconv` project.

------

## ⭐ Star This Repo If It Helped You

If this saved you days of build pain or unblocked your inference pipeline,
 **a star is the best way to say thanks** ⭐

------

## 🚧 Roadmap

```
- [ ] TensorRT plugin examples
- [ ] CMake config package (find_package support)
- [ ] CUDA 12.x support
```
