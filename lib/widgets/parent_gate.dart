import 'package:flutter/material.dart';
import '../design/tokens.dart';

Future<bool> showParentGate(BuildContext context) async {
  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (context) => const _ParentGateDialog(),
  );
  return result ?? false;
}

class _ParentGateDialog extends StatefulWidget {
  const _ParentGateDialog();

  @override
  State<_ParentGateDialog> createState() => _ParentGateDialogState();
}

class _ParentGateDialogState extends State<_ParentGateDialog> {
  final TextEditingController _controller = TextEditingController();
  bool _hasError = false;

  void _verify() {
    if (_controller.text.trim() == '12') {
      Navigator.of(context).pop(true);
    } else {
      setState(() {
        _hasError = true;
        _controller.clear();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: FVTokens.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(FVTokens.radiusCard),
      ),
      title: const Text(
        'For Parents',
        style: TextStyle(color: FVTokens.ink),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'What is 7 + 5?',
            style: TextStyle(color: FVTokens.ink),
          ),
          const SizedBox(height: FVTokens.m),
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(FVTokens.radiusButton),
              ),
              errorText: _hasError ? 'Incorrect, try again' : null,
            ),
            onSubmitted: (_) => _verify(),
          ),
        ],
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(
            minimumSize: const Size(FVTokens.aMinTapTarget, FVTokens.aMinTapTarget),
          ),
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('Cancel', style: TextStyle(color: FVTokens.ink)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(FVTokens.aMinTapTarget, FVTokens.aMinTapTarget),
          ),
          onPressed: _verify,
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
