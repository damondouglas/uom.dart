part of uom;

class mL extends Uom {
	mL(num value) {
		this.value = value;
		numeratorUnits = ['mL'];
		convertMap[dL] = 1/100;
	}

	Uom convertTo(Type uomType) {
		if (convertMap.containsKey(uomType)) {

			var factor = convertMap[uomType];
			if(uomType == dL) return new dL(factor*value);


		} else throw new UnsupportedError('${this.runtimeType} does not convert to ${uomType}');
	}
}


class dL extends Uom {
	dL(num value) {
		this.value = value;
		numeratorUnits = ['dL'];
		convertMap[mL] = 100;
	}

	Uom convertTo(Type uomType) {
		if (convertMap.containsKey(uomType)) {

			var factor = convertMap[uomType];
			if(uomType == mL) return new mL(factor*value);

		} else throw new UnsupportedError('${this.runtimeType} does not convert to ${uomType}');
	}
}


