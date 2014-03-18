[![Stories in Ready](https://badge.waffle.io/damondouglas/uom.dart.png?label=ready&title=Ready)](https://waffle.io/damondouglas/uom.dart)
[![Build Status](https://drone.io/github.com/damondouglas/uom.dart/status.png)](https://drone.io/github.com/damondouglas/uom.dart/latest)
uom.dart
========

A Dart Library for Handling Unit of Measures in Medical Applications.

## Usage
```dart
import 'package:uom/uom.dart';
```

## Weight

```dart
kg patientWeightInKg = new kg(80); 						// 80 kg

lbs patientWeightInLbs = new lbs(176.37); 				// 176.37 lbs

kg newWeight = patientWeightInKg + new kg(1);			// 81 kg

lbs convertWeight = patientWeightInKg.convertTo(lbs);   // 176.37 lbs
```

## Height

```dart
cm patientHeightInCm = new cm(165.1);					// 165.1 cm

```

## Ratios

```dart
mgPerkg medicationDose = new mgPerkg(1);				// 1 mg/kg

kg patientWeight = new kg(80);							// 80 kg

mg doseValue = medicationDose * patientWeight;			// 80 mg

mgPermL concentration = new mgPermL(10);				// 10 mg / mL

mL doseVolume = doseValue / concentration;				// 8 mL
```

