import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String operation, description;
  final VoidCallback onPressed;
  final Color operationColor;
  final bool isLoading;

  const AppButton(
      {required this.operation,
      required this.description,
      required this.onPressed,
      required this.operationColor,
      required this.isLoading,
      super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: size.height * 0.07,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                operation,
                style: TextStyle(
                    color: operationColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
              isLoading
                  ? const CircularProgressIndicator(
                      color: Colors.green,
                    )
                  : Container(),
              Text(
                description,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 25,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      ),
    );
  }
}
