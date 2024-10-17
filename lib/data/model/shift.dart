class Shift {
  final String duration;
  bool isSelected;

  Shift({required this.duration, this.isSelected = false});

  Shift copy({String? duration, bool? isSelected}) => Shift(
        duration: duration ?? this.duration,
        isSelected: isSelected ?? this.isSelected,
      );

  @override
  String toString() => "Duration: $duration, isSelected: $isSelected";
}
