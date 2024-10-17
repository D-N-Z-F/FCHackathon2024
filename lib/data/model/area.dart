class Area {
  final String code;
  bool isSelected;

  Area({required this.code, this.isSelected = false});

  Area copy({String? code, bool? isSelected}) => Area(
        code: code ?? this.code,
        isSelected: isSelected ?? this.isSelected,
      );

  @override
  String toString() => "Code: $code, isSelected: $isSelected";

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Area &&
        other.code == code &&
        other.isSelected == isSelected;
  }

  @override
  int get hashCode => code.hashCode ^ isSelected.hashCode;
}
