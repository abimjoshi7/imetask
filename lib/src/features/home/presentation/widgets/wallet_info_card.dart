import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imepay/src/core/utils/extensions.dart';
import 'package:imepay/src/core/utils/color_palette.dart';
import 'package:imepay/src/features/features.dart';
import 'package:imepay/src/features/wallet/wallet.dart';

class WalletInfoCard extends StatefulWidget {
  const WalletInfoCard({super.key});

  @override
  State<WalletInfoCard> createState() => _WalletInfoCardState();
}

class _WalletInfoCardState extends State<WalletInfoCard> {
  bool _isObfuscated = true;

  void _toggleObfuscation() {
    setState(() {
      _isObfuscated = !_isObfuscated;
    });
  }

  Widget _buildRow(String label, IconData icon, String value, TextStyle? style,
      {TextStyle? iconStyle, String? additionText}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              label,
              style: context.labelSmall?.copyWith(color: kClrDisabled),
            ),
            Icon(icon, size: 16, color: kClrDisabled),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              value,
              style: style,
            ),
            if (additionText != null)
              Container(
                margin: const EdgeInsets.only(left: 4),
                decoration: BoxDecoration(
                  color: kClrGreen,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: Text(
                  additionText,
                  style: context.titleSmall?.copyWith(
                    color: kClrSystem,
                  ),
                ),
              )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final walletState = context.watch<WalletCubit>().state;
    final walletAmount =
        walletState is WalletSuccess && walletState.walletDetails.isNotEmpty
            ? walletState.walletDetails.first.amount
            : "0";
    final interestAmount =
        walletState is WalletSuccess && walletState.walletDetails.isNotEmpty
            ? walletState.walletDetails.first.interestAmount
            : "0";

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: _toggleObfuscation,
              child: _buildRow(
                "Super Wallet Account Rs. ",
                _isObfuscated ? Icons.visibility_off : Icons.visibility,
                _isObfuscated ? "******" : walletAmount,
                context.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: _isObfuscated ? 16 : 0,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildRow(
                    "Interest Earned ",
                    Icons.info_rounded,
                    _isObfuscated ? "******" : "+$interestAmount",
                    context.titleSmall?.copyWith(
                      color: _isObfuscated ? null : kClrGreen,
                    ),
                    iconStyle: context.titleSmall?.copyWith(color: kClrSystem),
                    additionText: "@3.05%"),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Placeholder(
            fallbackWidth: context.height * 0.1,
          ),
        ),
      ],
    );
  }
}
