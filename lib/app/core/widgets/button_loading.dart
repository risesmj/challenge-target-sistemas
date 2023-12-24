import 'package:flutter/material.dart';

class ButtonLoading extends StatefulWidget {
  final Future<void> Function() onPressed;
  final String? label;

  const ButtonLoading({
    super.key,
    required this.onPressed,
    this.label,
  });

  @override
  State<ButtonLoading> createState() => _ButtonLoadingState();
}

class _ButtonLoadingState extends State<ButtonLoading> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        setState(() {
          _isLoading = true;
        });

        await widget.onPressed();

        setState(() {
          _isLoading = false;
        });
      },
      style: const ButtonStyle(
        minimumSize: MaterialStatePropertyAll(Size(150, 60)),
        maximumSize: MaterialStatePropertyAll(Size(150, 60)),
        backgroundColor: MaterialStatePropertyAll(
          Color(0xFF44bd6e),
        ),
      ),
      child: _isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            )
          : Text(
              widget.label ?? '',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
    );
  }
}
