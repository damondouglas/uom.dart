library uom;

class Uom {
	List<String> numeratorUnits = [];
	List<String> denominatorUnits = [];
	num value;
	Map convertMap = {};

	Uom operator *(Uom other) {
		var newUom = new Uom();
		newUom.value = value * other.value;

		newUom.numeratorUnits = numeratorUnits;
		newUom.numeratorUnits
		..addAll(other.numeratorUnits)
		..sort();

		newUom.denominatorUnits = denominatorUnits;
		newUom.denominatorUnits
		..addAll(other.denominatorUnits)
		..sort();

		return newUom;
	}

	Uom operator /(Uom other) {
		var newUom = new Uom();
		newUom.value = value / other.value;

		newUom.numeratorUnits = new List.from(numeratorUnits);
		newUom.numeratorUnits
		..addAll(other.denominatorUnits)
		..sort();

		newUom.denominatorUnits = new List.from(denominatorUnits);
		newUom.denominatorUnits
		..addAll(other.numeratorUnits)
		..sort();

		var shareList = new List.from(newUom.numeratorUnits);
		shareList.retainWhere((item) => newUom.denominatorUnits.contains(item));

		newUom.numeratorUnits.removeWhere((item) => shareList.contains(item));
		newUom.denominatorUnits.removeWhere((item) => shareList.contains(item));

		return newUom;
	}

	Uom operator +(Uom other) {
		
		String numeratorUnitsStr = numeratorUnits.fold('', (prev, element) => prev+element);
		String denominatorUnitsStr = denominatorUnits.fold('', (prev, element) => prev+element);

		String otherNumeratorUnitsStr   = other.numeratorUnits.fold('', (prev, element) => prev+element);
		String otherDenominatorUnitsStr = other.denominatorUnits.fold('', (prev, element) => prev+element);		

		if (numeratorUnitsStr != otherNumeratorUnitsStr || denominatorUnitsStr != otherDenominatorUnitsStr) {
			throw new UnsupportedError("'+' operation not valid for ${this.runtimeType} and ${other.runtimeType}");
		}			
		
		var newUom = new Uom();
		newUom.value = value + other.value;		

		newUom.numeratorUnits = numeratorUnits;
		newUom.denominatorUnits = denominatorUnits;

		return newUom;
	}

	Uom operator -(Uom other) {
		
		String numeratorUnitsStr = numeratorUnits.fold('', (prev, element) => prev+element);
		String denominatorUnitsStr = denominatorUnits.fold('', (prev, element) => prev+element);

		String otherNumeratorUnitsStr   = other.numeratorUnits.fold('', (prev, element) => prev+element);
		String otherDenominatorUnitsStr = other.denominatorUnits.fold('', (prev, element) => prev+element);		

		if (numeratorUnitsStr != otherNumeratorUnitsStr || denominatorUnitsStr != otherDenominatorUnitsStr) {
			throw new UnsupportedError("'-' operation not valid for ${this.runtimeType} and ${other.runtimeType}");
		}			
		
		var newUom = new Uom();
		newUom.value = value - other.value;		

		newUom.numeratorUnits = numeratorUnits;
		newUom.denominatorUnits = denominatorUnits;

		return newUom;
	}

	Uom convertTo(Type uomType) {
		var newUom = new Uom();

		if (convertMap.containsKey(uomType)) {
			var factor = convertMap[uomType];
			newUom.value = other.value * factor;
			newUom.numeratorUnits = other.numeratorUnits;
			newUom.denominatorUnits = other.denominatorUnits;
		} else throw new UnsupportedError("${this.runtimeType} does not convert to ${other.runtimeType}");

		return newUom;
	}

}