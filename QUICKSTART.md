# ⚡ Quick Start Guide

Get analyzing pantograph data in **3 minutes**!

## 📋 Prerequisites

- MATLAB R2019b or later
- Data files: `one.csv` and `two.csv` in `data/` folder

## 🚀 Quick Run

### Step 1: Open MATLAB

```matlab
% Navigate to project directory
cd('/path/to/pantograph-signal-analysis/src')
```

### Step 2: Run Analysis

```matlab
% Basic Analysis
task1  % View raw acceleration plots

% Complete Analysis
task6  % All plots including FFT
% When prompted, enter: 5  (for 5-second intervals)
```

## 📊 What Each Task Does

| Task | Purpose | Interactive? |
|------|---------|--------------|
| **task1** | Plot raw Z1 acceleration | No |
| **task2** | Time-normalized plots | No |
| **task3** | Calculate missing data | No |
| **task4** | Plots with statistics | No |
| **task5** | RMS over time | ✅ Yes (time interval) |
| **task6** | Complete analysis suite | ✅ Yes (time interval) |
| **task7** | Anomaly detection | ✅ Yes (time + threshold) |

## 🎯 Recommended First Run

```matlab
% 1. Check data quality
task3

% 2. View complete analysis
task6
% Enter: 5  (analyze in 5-second windows)
```

## 📈 Expected Outputs

### Task 1:
- Figure 1: Z1 acceleration (Dataset One)
- Figure 2: Z1 acceleration (Dataset Two)

### Task 6:
- 8 subplots showing:
  - Time-domain signals
  - RMS values
  - FFT magnitude
  - FFT phase

## 🔧 Common Inputs

**Time Interval** (task5, task6, task7):
- `5` = Analyze in 5-second windows (12 windows total)
- `10` = Analyze in 10-second windows (6 windows)
- `15` = 15-second windows (4 windows)

**RMS Threshold** (task7):
- `0.5` = Alert if RMS > 0.5g (normal vibration)
- `1.0` = Alert if RMS > 1.0g (elevated vibration)
- `1.5` = Alert if RMS > 1.5g (high vibration)

## ✅ Verify Installation

```matlab
% Check if data files are accessible
ls ../data/*.csv

% Should show:
% one.csv
% two.csv
```

## 🐛 Quick Troubleshooting

**Error: "File not found"**
```matlab
% Solution: Use full path
a = csvread('../data/one.csv', 1, 0);
```

**No plots appear**
```matlab
% Solution: Force display
figure(1); shg
```

**Want to analyze different axis?**
```matlab
% Edit the task file, change column index
% Column 3 = X1, Column 4 = Y1, Column 5 = Z1
plot(a(2:end,1), a(2:end,3));  % X1 instead of Z1
```

## 📖 Next Steps

Read full [README.md](README.md) for:
- Detailed task explanations
- Signal processing theory
- Result interpretation
- Customization options

---

**Ready to analyze!** 🚀
