# 📊 Pantograph Signal Analysis - MATLAB Data Processing

[![MATLAB](https://img.shields.io/badge/MATLAB-R2019b%2B-orange.svg)](https://www.mathworks.com/products/matlab.html)
[![Signal Processing](https://img.shields.io/badge/Signal%20Processing-FFT%20%7C%20RMS-blue.svg)](https://www.mathworks.com/products/signal.html)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Industry](https://img.shields.io/badge/Industry-Railway%20Systems-red.svg)](README.md)

> **Mechanical Engineering Internship Project: Advanced signal processing and statistical analysis of pantograph acceleration data for railway systems**

A comprehensive MATLAB-based analysis suite for processing multi-axis acceleration data from pantograph monitoring systems, featuring FFT analysis, RMS calculations, data quality assessment, and anomaly detection.

---

## 🏢 Project Context

**Company:** PANTOhealth  
**Position:** Mechanical Engineering Intern  
**Duration:** August 2021 - September 2021  
**Industry:** Railway Systems / Transportation  
**Focus:** Pantograph Health Monitoring & Predictive Maintenance

### What is a Pantograph?

A pantograph is the mechanical device mounted on railway vehicles that collects electric current from overhead wires. Monitoring pantograph vibrations is critical for:
- 🔌 Electrical contact quality
- 🛤️ Track condition assessment
- 🔧 Predictive maintenance
- ⚠️ Failure prevention
- 📈 System reliability

---

## 📸 Railway Pantograph System

<div align="center">
  <img src="images/pantograph.jpg" alt="Railway Pantograph" width="85%">
  <p><em>Real railway pantograph collecting power from overhead wire - the mechanical system monitored in this project</em></p>
</div>

### What You're Seeing

**Key Components:**
- 🔌 **Diamond Contact Frame** (top) - Touches overhead catenary wire
- ⚡ **Spring Suspension** - Maintains constant contact pressure
- 🔧 **Articulated Arms** - Allow vertical movement
- 📊 **Base Mount** - Where acceleration sensors are installed

**Our Analysis:**
This project analyzes vibration data from sensors mounted on pantograph systems like this one:
- **Dataset one.csv**: 8,270 samples from Sensor 1 (Z-axis)
- **Dataset two.csv**: 8,280 samples from Sensor 1 (Z-axis)
- **Sampling Rate**: ~138 Hz
- **Duration**: 60 seconds per measurement

---

## 📋 Table of Contents

- [Features](#features)
- [Data Structure](#data-structure)
- [Analysis Tasks](#analysis-tasks)
- [Installation](#installation)
- [Usage](#usage)
- [Results](#results)
- [Technical Details](#technical-details)

---

## ✨ Features

### Signal Processing Capabilities

- 📈 **Time-Domain Analysis** - Acceleration plotting and visualization
- 📊 **Frequency-Domain Analysis** - FFT for spectral content
- 📉 **RMS Calculation** - Root Mean Square for vibration intensity
- 🔍 **Data Quality Assessment** - Missing data detection
- ⚠️ **Anomaly Detection** - Threshold-based alert system
- 📐 **Multi-Axis Support** - X, Y, Z acceleration components
- 🎯 **Comparative Analysis** - Multiple dataset comparison

### Data Processing Features

- ✅ Multi-sensor support (4 sensors, 3 axes each = 12 channels)
- ✅ Time-synchronized analysis
- ✅ Automatic missing data detection
- ✅ Configurable time intervals
- ✅ RMS threshold monitoring
- ✅ Magnitude and phase analysis
- ✅ Comprehensive visualization

---

## 📁 Project Structure

```
Internship/
├── src/
│   ├── task1.m          # Basic acceleration plotting
│   ├── task2.m          # Time-normalized plotting
│   ├── task3.m          # Missing data detection
│   ├── task4.m          # Combined analysis with stats
│   ├── task5.m          # RMS calculation over intervals
│   ├── task6.m          # Complete analysis suite (FFT + RMS)
│   └── task7.m          # Anomaly detection with thresholds
├── data/
│   ├── one.csv          # Dataset 1 (8270 samples)
│   └── two.csv          # Dataset 2 (8280 samples)
├── results/
│   └── (Generated plots and analysis outputs)
├── docs/
│   └── ANALYSIS_GUIDE.md
├── README.md            # This file
└── LICENSE              # MIT License
```

---

## 📊 Data Structure

### CSV Format

```csv
Time,RecordID,X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3,X4,Y4,Z4
133,228534,0.06,-0.13,0.35,0,0,0,0.28,0.17,0.05,-0.09,0.18,-0.07
134,228535,-0.32,0.01,0.04,0,0,0,0.07,0.01,-0.05,-0.16,0.19,-0.03
...
```

### Data Columns

| Column | Index | Description | Unit |
|--------|-------|-------------|------|
| **Time** | 1 | Timestamp | seconds (s) |
| **RecordID** | 2 | Sequential record identifier | - |
| **X1, Y1, Z1** | 3-5 | Sensor 1 acceleration (X, Y, Z) | g (gravity) |
| **X2, Y2, Z2** | 6-8 | Sensor 2 acceleration (X, Y, Z) | g |
| **X3, Y3, Z3** | 9-11 | Sensor 3 acceleration (X, Y, Z) | g |
| **X4, Y4, Z4** | 12-14 | Sensor 4 acceleration (X, Y, Z) | g |

### Dataset Overview

| Dataset | Filename | Samples | Duration | Sampling Rate |
|---------|----------|---------|----------|---------------|
| **One** | one.csv | 8,270 | ~60s | ~138 Hz |
| **Two** | two.csv | 8,280 | ~60s | ~138 Hz |

**Primary Focus:** Z1 axis (vertical acceleration of sensor 1)

---

## 🔧 Analysis Tasks

### Task 1: Basic Acceleration Plotting

**File:** `task1.m`

**Purpose:** Visualize raw Z1 acceleration data

**Code Overview:**
```matlab
a = csvread('one.csv', 1, 0);  % Skip header
b = csvread('two.csv', 1, 0);

plot(a(2:end,1), a(2:end,5));  % Time vs Z1
title('acceleration(Z1)');
xlabel('time(s)');
ylabel('amplitude(g)');
```

**Output:** 2 figures showing Z1 acceleration vs time

---

### Task 2: Time-Normalized Plotting

**File:** `task2.m`

**Purpose:** Normalize time axis to 0-60 seconds

**Key Feature:**
```matlab
one = linspace(0, 60, length(a)-1);  % Create uniform time vector
plot(one, a(2:end,5));
```

**Why Important:** Handles irregular sampling and makes data comparable

---

### Task 3: Missing Data Detection

**File:** `task3.m`

**Purpose:** Calculate number of missing records

**Algorithm:**
```matlab
one = diff(a(:,2)) - 1;  % Difference in RecordID
missdataofC = sum(one)   % Total missing samples
```

**Interpretation:**
- `diff(a(:,2))` should be 1 for consecutive records
- Any value > 1 indicates missing data
- Sum gives total missing samples

---

### Task 4: Combined Analysis with Statistics

**File:** `task4.m`

**Purpose:** Plot data with embedded statistics

**Features:**
- Side-by-side comparison
- Data count display
- Missing data calculation
- Text annotations on plots

**Output:**
```
number of one data = 8270
missdata of one = [calculated value]
number of two data = 8280  
missdata of two = [calculated value]
```

---

### Task 5: RMS Calculation Over Time

**File:** `task5.m`

**Purpose:** Calculate Root Mean Square (RMS) over configurable intervals

**User Input:**
```matlab
t = input('enter your Time interval =');  % e.g., 5 seconds
```

**Algorithm:**
1. Divide 60s into `n` intervals of `t` seconds
2. Calculate RMS for each interval: `rms = sqrt(mean(x^2))`
3. Plot RMS vs time

**RMS Formula:**
```
RMS = √(1/N * Σ(xi²))
```

**Why RMS?**
- Indicates vibration intensity
- Effective for comparing different conditions
- Standard metric in vibration analysis

---

### Task 6: Complete Analysis Suite ⭐

**File:** `task6.m`

**Purpose:** Comprehensive analysis with 8 subplots

**Subplots:**

| Position | Content | Description |
|----------|---------|-------------|
| (4,2,1) | Z1 acceleration (one) | Time-domain signal |
| (4,2,2) | Z1 acceleration (two) | Time-domain signal |
| (4,2,3) | RMS (one) | Vibration intensity |
| (4,2,4) | RMS (two) | Vibration intensity |
| (4,2,5) | FFT Magnitude (one) | Frequency content |
| (4,2,6) | FFT Magnitude (two) | Frequency content |
| (4,2,7) | FFT Phase (one) | Phase spectrum |
| (4,2,8) | FFT Phase (two) | Phase spectrum |

**FFT Analysis:**
```matlab
y1 = fft(A);                    % Fast Fourier Transform
m1 = abs(y1);                   % Magnitude spectrum
p = unwrap(angle(y1));          % Phase spectrum
f1 = (0:length(y1)-1)*100/length(y1);  % Frequency vector
```

**This is the most comprehensive task!**

---

### Task 7: Anomaly Detection

**File:** `task7.m`

**Purpose:** Detect RMS values exceeding threshold

**User Inputs:**
```matlab
t = input('enter your Time interval =');  % Time interval
c = input('enter your rms interval =');   % RMS threshold
```

**Detection Logic:**
```matlab
if sC(:,:,z) > c
    disp(sC)  % Display anomalous RMS value
end
```

**Applications:**
- Predictive maintenance
- Fault detection
- Quality monitoring
- Alert systems

---

## 🚀 Installation

### Prerequisites

- **MATLAB R2019b or later**
- **Signal Processing Toolbox** (recommended)
- No additional toolboxes required

### Setup

```bash
# 1. Clone repository
git clone https://github.com/AmirHosseinOsooli/Internship.git
cd Internship

# 2. Open MATLAB
matlab &

# 3. Set working directory
cd('/path/to/Internship/src')

# 4. Add data folder to path
addpath('../data')
```

---

## 💻 Usage

### Quick Start

```matlab
% In MATLAB command window:
cd src

% Run Task 1 (Basic plotting)
task1

% Run Task 6 (Complete analysis)
task6
% Enter time interval: 5
```

### Recommended Workflow

**Step 1: Data Quality Check**
```matlab
task3  % Check missing data
task4  % View data with statistics
```

**Step 2: Time-Domain Analysis**
```matlab
task1  % Raw acceleration plots
task2  % Time-normalized plots
```

**Step 3: RMS Analysis**
```matlab
task5
% Enter time interval: 5  % Analyze in 5-second windows
```

**Step 4: Frequency Analysis**
```matlab
task6
% Enter time interval: 5
% Get complete analysis with FFT
```

**Step 5: Anomaly Detection**
```matlab
task7
% Enter time interval: 5
% Enter RMS threshold: 0.5  % Alert if RMS > 0.5g
```

---

## 📈 Results & Interpretation

### RMS Analysis

**Typical RMS Values:**
- **Low vibration**: RMS < 0.2g
- **Normal operation**: RMS = 0.2-0.5g
- **Elevated vibration**: RMS = 0.5-1.0g
- **High vibration**: RMS > 1.0g (⚠️ investigate)

### FFT Analysis

**Key Frequencies to Monitor:**
- **0-10 Hz**: Track irregularities
- **10-50 Hz**: Pantograph resonance
- **50-100 Hz**: Electrical system harmonics
- **>100 Hz**: High-frequency vibrations

### Missing Data

**Acceptable Rates:**
- **<1%**: Excellent data quality ✅
- **1-5%**: Good (minor gaps)
- **5-10%**: Fair (consider interpolation)
- **>10%**: Poor (investigate sensor/recording issues)

---

## 🔬 Technical Details

### Sampling Considerations

**Nyquist Theorem:**
- Sampling rate: ~138 Hz
- Maximum detectable frequency: ~69 Hz
- Recommended for: 0-60 Hz vibration analysis

### RMS Calculation Method

```matlab
function rms_value = calculate_rms(data)
    rms_value = sqrt(mean(data.^2));
end
```

**Properties:**
- Insensitive to signal phase
- Represents effective vibration magnitude
- Ideal for comparing different time periods

### FFT Implementation

```matlab
y = fft(signal);              % Complex FFT
magnitude = abs(y);           % Magnitude spectrum
phase = angle(y);             % Phase spectrum
phase_unwrapped = unwrap(phase);  % Remove 2π jumps

% Frequency vector
fs = 138;  % Sampling frequency (Hz)
f = (0:length(y)-1) * fs / length(y);
```

---

## 📊 Data Quality Metrics

### Missing Data Detection

**Method:**
```matlab
recordID_diff = diff(RecordID);
expected_diff = 1;
missing_count = sum(recordID_diff - expected_diff);
```

**Example:**
```
RecordID: [100, 101, 102, 105, 106]
           └─1─┘ └─1─┘ └─3─┘ └─1─┘
Missing: 0 + 0 + 2 + 0 = 2 records
```

---

## 🎯 Key Findings (Template)

### Dataset Comparison

| Metric | Dataset One | Dataset Two |
|--------|-------------|-------------|
| **Total Records** | 8,270 | 8,280 |
| **Missing Data** | [Calculate] | [Calculate] |
| **Mean RMS (Z1)** | [Calculate] | [Calculate] |
| **Max Acceleration** | [Calculate] | [Calculate] |
| **Dominant Frequency** | [From FFT] | [From FFT] |

### Observations

*(Example - replace with actual results)*

- ✅ Data quality: Excellent (<1% missing)
- ✅ RMS values within normal range (0.2-0.4g)
- ⚠️ Frequency peak at 45 Hz (monitor for resonance)
- ✅ Both datasets show consistent patterns

---

## 🔧 Customization

### Change Analyzed Axis

```matlab
% Instead of Z1 (column 5), use X1 (column 3) or Y1 (column 4)
plot(a(2:end,1), a(2:end,3));  % X1 axis
plot(a(2:end,1), a(2:end,4));  % Y1 axis
```

### Adjust Time Intervals

```matlab
% In task5.m, task6.m, task7.m
t = 10;  % 10-second intervals instead of user input
```

### Modify RMS Threshold

```matlab
% In task7.m
c = 0.8;  % Alert if RMS exceeds 0.8g
```

---

## 🐛 Troubleshooting

### Issue: "File not found"

**Solution:**
```matlab
% Make sure you're in the src directory
cd('/path/to/Internship/src')

% Or use full path
a = csvread('../data/one.csv', 1, 0);
```

---

### Issue: "Index exceeds matrix dimensions"

**Cause:** Trying to access column that doesn't exist

**Solution:**
```matlab
% Check data dimensions
size(a)  % Should be [N, 14] (14 columns)

% Verify column indices
% Column 1: Time
% Column 5: Z1
```

---

### Issue: Plots don't appear

**Solution:**
```matlab
% Force figure to front
figure(1);
shg  % Show most recent graph window
```

---

## 📚 Signal Processing Concepts

### Root Mean Square (RMS)

**Definition:** Measure of signal magnitude

**When to use:**
- Vibration intensity
- Energy content
- Comparing signals of different lengths

### Fast Fourier Transform (FFT)

**Definition:** Converts time-domain signal to frequency-domain

**When to use:**
- Identify dominant frequencies
- Detect periodic components
- Frequency analysis

**MATLAB Implementation:**
```matlab
Y = fft(signal);
% Y(1) = DC component
% Y(2:N/2) = Positive frequencies
% Y(N/2+1:N) = Negative frequencies (conjugate)
```

---

## 🎓 Learning Outcomes

This project demonstrates:

### MATLAB Programming
- ✅ CSV file reading and parsing
- ✅ Data manipulation and indexing
- ✅ Loop structures and conditionals
- ✅ Function usage (fft, rms, diff, etc.)
- ✅ User input handling

### Signal Processing
- ✅ Time-domain analysis
- ✅ Frequency-domain analysis (FFT)
- ✅ RMS calculations
- ✅ Phase unwrapping
- ✅ Spectral analysis

### Data Visualization
- ✅ Multi-subplot layouts
- ✅ Custom plot formatting
- ✅ Text annotations
- ✅ Comparative visualization

### Engineering Analysis
- ✅ Data quality assessment
- ✅ Statistical metrics
- ✅ Anomaly detection
- ✅ Threshold monitoring

---

## 🚀 Future Enhancements

### Potential Improvements

1. **Automated Reporting**
   ```matlab
   % Generate PDF report with all plots and statistics
   publish('analysis_script.m', 'pdf');
   ```

2. **Real-Time Monitoring**
   ```matlab
   % Live data acquisition and analysis
   while true
       data = acquire_new_data();
       rms_val = rms(data);
       if rms_val > threshold
           send_alert();
       end
   end
   ```

3. **Machine Learning Integration**
   ```matlab
   % Predict anomalies using trained model
   features = extract_features(signal);
   prediction = model.predict(features);
   ```

4. **Advanced Filters**
   ```matlab
   % Butterworth bandpass filter
   [b,a] = butter(4, [0.1 0.5]);
   filtered = filtfilt(b, a, signal);
   ```

---

## 📖 References

### Signal Processing
- [MATLAB Signal Processing Documentation](https://www.mathworks.com/help/signal/)
- [FFT Analysis Guide](https://www.mathworks.com/help/matlab/math/fast-fourier-transform-fft.html)
- [RMS Calculation](https://www.mathworks.com/help/matlab/ref/rms.html)

### Railway Systems
- Pantograph-Catenary Interaction Dynamics
- Railway Vehicle Vibration Analysis Standards
- Predictive Maintenance in Rail Systems

---

## 🤝 Contributing

This is an internship project repository. Feel free to:
- 🐛 Report issues
- 💡 Suggest improvements
- 📖 Improve documentation
- 🔧 Submit pull requests

---

## 📄 License

MIT License - See [LICENSE](LICENSE) file for details

---

## 👤 Author

**AmirHossein Osooli**

---

## 📞 Contact

**Project Context:**
- **Company**: PANTOhealth
- **Role**: Mechanical Engineering Intern
- **Period**: August 2021 - September 2021
- **Focus**: Signal Processing & Data Analysis

---

<div align="center">

## 📊 MATLAB Signal Analysis for Railway Systems

[![MATLAB](https://img.shields.io/badge/MATLAB-R2019b%2B-orange.svg)](https://www.mathworks.com/)
[![Signal Processing](https://img.shields.io/badge/Analysis-FFT%20%7C%20RMS-blue.svg)](README.md)
[![Industry](https://img.shields.io/badge/Industry-Railway-red.svg)](README.md)

**[Installation](#installation)** • **[Usage](#usage)** • **[Tasks](#analysis-tasks)** • **[Results](#results)**

**Internship Project** | **Data Analysis** | **Vibration Monitoring** | **Predictive Maintenance**

⭐ **Star this repository if you find it useful!**

---

*Professional signal processing and statistical analysis for railway pantograph health monitoring*

</div>
