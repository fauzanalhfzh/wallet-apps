String? uValidator({
  required String? value,
  bool isRequired = false,
  bool isEmail = false,
  int? minLength,
}) {
  if (isRequired) {
    if (value == null || value.isEmpty) {
      return "Required";
    }

    if (isEmail) {
      if (!value.contains("@") || !value.contains(".")) {
        return "Invalid email";
      }
    }

    if (minLength != null) {
      if (value.length < minLength) {
        return "Min $minLength character";
      }
    }
  }

  return null;
}
