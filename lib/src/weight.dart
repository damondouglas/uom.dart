part of uom;

class kg extends Uom {
	kg(num value) {
		this.value = value;
		numeratorUnits = ['kg'];
		convertMap[lbs] = 2.20462;
	}

	Uom convertTo(Type uomType) {
		if (convertMap.containsKey(uomType)) {

			var factor = convertMap[uomType];
			if(uomType == lbs) return new lbs(factor*value);

		} else throw new UnsupportedError('${this.runtimeType} does not convert to ${uomType}');
	}
}


class lbs extends Uom {
	lbs(num value) {
		this.value = value;
		numeratorUnits = ['lbs'];
		convertMap[kg] = 1/2.20462;
	}

	Uom convertTo(Type uomType) {
		if (convertMap.containsKey(uomType)) {

			var factor = convertMap[uomType];
			if(uomType == kg) return new kg(factor*value);

		} else throw new UnsupportedError('${this.runtimeType} does not convert to ${uomType}');
	}
}


