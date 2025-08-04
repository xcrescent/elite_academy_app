import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../utils/form_validators.dart';

class CommonFormComponents {
  static Widget buildNameField({
    required Function(String) onChanged,
    String? initialValue,
    String label = 'Name',
    IconData icon = Icons.person,
    bool isRequired = true,
  }) {
    return TextFormField(
      initialValue: initialValue,
      validator: isRequired 
          ? (value) => FormValidators.validateName(value, fieldName: label.toLowerCase())
          : null,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
      ),
    );
  }

  static Widget buildPhoneField({
    required Function(String) onChanged,
    String? initialValue,
    String label = 'Phone number',
    bool isRequired = true,
    int? maxLength = 10,
  }) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: const Icon(Icons.phone),
      ),
      buildCounter: maxLength != null 
          ? (BuildContext context, {required int currentLength, required bool isFocused, required int? maxLength}) => null
          : null,
      maxLength: maxLength,
      validator: (value) => FormValidators.validatePhoneNumber(value, isRequired: isRequired),
      keyboardType: TextInputType.phone,
    );
  }

  static Widget buildEmailField({
    required Function(String) onChanged,
    String? initialValue,
    String label = 'Email',
    bool isRequired = true,
    bool autoValidate = false,
  }) {
    return TextFormField(
      initialValue: initialValue,
      validator: (value) => FormValidators.validateEmail(value, isRequired: isRequired),
      autovalidateMode: autoValidate ? AutovalidateMode.onUserInteraction : null,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: const Icon(Icons.email),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  static Widget buildPasswordField({
    required Function(String) onChanged,
    String? initialValue,
    TextEditingController? controller,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      initialValue: controller == null ? initialValue : null,
      controller: controller,
      validator: FormValidators.validatePassword,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(Icons.password),
        suffixIcon: suffixIcon,
      ),
      keyboardType: TextInputType.visiblePassword,
    );
  }

  static Widget buildDateField({
    required Function(DateTime?) onChanged,
    required BuildContext context,
    DateTime? initialValue,
    String label = 'Date of Birth',
    bool isRequired = false,
  }) {
    return TextFormField(
      initialValue: initialValue != null 
          ? DateFormat('dd-MM-yyyy').format(initialValue)
          : null,
      onChanged: (_) {},
      decoration: InputDecoration(
        labelText: '$label${!isRequired ? ' (optional)' : ''}',
        prefixIcon: const Icon(Icons.cake),
      ),
      validator: isRequired 
          ? (value) => FormValidators.requiredField(value, fieldName: label)
          : null,
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: initialValue ?? DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
        );
        if (date != null) {
          onChanged(date);
        }
      },
      readOnly: true,
    );
  }

  static Widget buildAddressField({
    required Function(String) onChanged,
    String? initialValue,
    String label = 'Address',
    bool isRequired = false,
    bool hasOutlineBorder = false,
  }) {
    return TextFormField(
      initialValue: initialValue,
      onChanged: onChanged,
      validator: isRequired 
          ? (value) => FormValidators.requiredField(value, fieldName: label)
          : null,
      decoration: InputDecoration(
        border: hasOutlineBorder ? const OutlineInputBorder() : null,
        labelText: '$label${!isRequired ? ' (optional)' : ''}',
        prefixIcon: const Icon(Icons.home),
      ),
      keyboardType: TextInputType.streetAddress,
    );
  }

  static Widget buildNumberField({
    required Function(String) onChanged,
    String? initialValue,
    required String label,
    IconData icon = Icons.numbers,
    bool isRequired = true,
  }) {
    return TextFormField(
      initialValue: initialValue,
      validator: isRequired 
          ? (value) => FormValidators.requiredField(value, fieldName: label)
          : null,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
      ),
      keyboardType: TextInputType.number,
    );
  }

  static Widget buildTextField({
    required Function(String) onChanged,
    String? initialValue,
    required String label,
    IconData icon = Icons.text_fields,
    bool isRequired = true,
  }) {
    return TextFormField(
      initialValue: initialValue,
      validator: isRequired 
          ? (value) => FormValidators.requiredField(value, fieldName: label)
          : null,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
      ),
      keyboardType: TextInputType.text,
    );
  }
}