import 'package:flutter/material.dart';
import 'package:grocery_app/common_widgets/app_text.dart';

class PromoCodePage extends StatefulWidget {
  @override
  _PromoCodePageState createState() => _PromoCodePageState();
}

class _PromoCodePageState extends State<PromoCodePage> {
  final TextEditingController _promoCodeController = TextEditingController();
  String? _promoCodeError; // For storing promo code validation error
  bool _isCodeApplied = false; // To check if a promo code has been applied
  bool _isCodeValid = false; // To check if the entered code is valid

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('प्रोमो कोड'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: 'अपना प्रोमो कोड दर्ज करें:',
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 10),
            _buildPromoCodeInput(),
            const SizedBox(height: 20),
            _buildApplyButton(),
            const SizedBox(height: 20),
            if (_isCodeApplied)
              AppText(
                text: 'कोड लागू किया गया!',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.green,
              ),
            if (_promoCodeError != null)
              AppText(
                text: _promoCodeError!,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
            if (!_isCodeApplied && !_isCodeValid && _promoCodeError == null)
              AppText(
                text: 'कोई प्रोमो कोड उपलब्ध नहीं है।',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPromoCodeInput() {
    return TextField(
      controller: _promoCodeController,
      decoration: InputDecoration(
        labelText: 'प्रोमो कोड',
        errorText: _promoCodeError,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            _promoCodeController.clear();
            setState(() {
              _promoCodeError = null; // Clear error message
              _isCodeApplied = false; // Reset the applied status
              _isCodeValid = false; // Reset the valid code status
            });
          },
        ),
      ),
      onChanged: (value) {
        // Clear error message when user starts typing
        setState(() {
          _promoCodeError = null;
          _isCodeValid = false; // Reset valid status on change
        });
      },
    );
  }

  Widget _buildApplyButton() {
    return ElevatedButton(
      onPressed: _applyPromoCode,
      child: const Text('लागू करें'),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15),
        textStyle: const TextStyle(fontSize: 16),
      ),
    );
  }

  void _applyPromoCode() {
    final promoCode = _promoCodeController.text.trim();
    if (promoCode.isEmpty) {
      setState(() {
        _promoCodeError = 'कृपया प्रोमो कोड दर्ज करें'; // Validation error message
        _isCodeApplied = false;
        _isCodeValid = false;
      });
      return;
    }

    // Here you can add your promo code validation logic
    // For demonstration, let's assume the valid code is "SAVE10"
    if (promoCode == 'SAVE10') {
      setState(() {
        _isCodeApplied = true; // Promo code applied successfully
        _promoCodeError = null; // Clear any previous error
        _isCodeValid = true; // Mark the code as valid
      });
    } else {
      setState(() {
        _promoCodeError = 'अमान्य प्रोमो कोड'; // Invalid promo code message
        _isCodeApplied = false;
        _isCodeValid = false; // Mark the code as invalid
      });
    }
  }
}