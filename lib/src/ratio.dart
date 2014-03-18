part of uom;

class mgPerkg extends Uom {
	mgPerkg(num value) {
		this.value = value;
		numeratorUnits = ['mg'];
		denominatorUnits = ['kg'];
	}
}


class mgPermL extends Uom {
	mgPermL(num value) {
		this.value = value;
		numeratorUnits = ['mg'];
		denominatorUnits = ['mL'];
	}
}