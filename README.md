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

num value = patientWeightInKg.toNum();					// 80

lbs patientWeightInLbs = new lbs(176.37); 				// 176.37 lbs

bool eval = patientWeightInKg == patientWeightInLbs; 	// true

lbs convertWgt = patientWeightInKg.toLbs();				// 176.37 lbs

kg newWeight = patientWeightInKg + new kg(1);			// 81 kg

kg newWeight2 = patientWeightInKg + new lbs(2.20462);	// 81 kg

kg nanNum = patientWeightInKg + 1;						// nanNum.toNum() = NaN

mg medicationDose = new mg(100);						// 100 mg
```

## Height

```dart
cm patientHeightInCm = new cm(165.1);					// 165.1 cm

inch value = patientHeightInCm.toInch();				// 65 inch

bool eval = patientHeightInCm == uom.toInch(65);		// true
```

## Ratios

```dart
mgkg medicationDose = new mg(1).per(new kg(1));			// 1 mg/kg

kg patientWeight = new kg(80);							// 80 kg

mg doseValue = medicationDose * patientWeight;			// 80 mg

mgmL concentration = new mg(10).per(new mL(1));			// 10 mg / mL

mL doseVolume = doseValue / concentration;				// 8 mL
```

