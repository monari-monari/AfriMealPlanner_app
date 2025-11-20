class Validators {
static String? email(String? value) {
if (value == null || value.isEmpty) return 'Email is required';
if (!value.contains('@')) return 'Invalid email address';
return null;
}


static String? notEmpty(String? value) {
if (value == null || value.isEmpty) return 'This field is required';
return null;
}
}