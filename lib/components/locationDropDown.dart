import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class CountryPickerField extends StatelessWidget {
  final String? selectedCountry;
  final Function(String) onCountrySelected;

  const CountryPickerField({
    super.key,
    required this.selectedCountry,
    required this.onCountrySelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCountryPicker(
          context: context,
          showPhoneCode: false,
          countryListTheme: CountryListThemeData(
            flagSize: 25,
            backgroundColor: Theme.of(context).colorScheme.primary,
            textStyle: TextStyle(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              fontFamily: 'Inter',
            ),
            inputDecoration: InputDecoration(
              hintText: 'Search country',
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
          ),
          onSelect: (Country country) {
            onCountrySelected(country.name);
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.onSecondary,
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedCountry ?? 'Select Country:',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Inter',
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ],
        ),
      ),
    );
  }
}
