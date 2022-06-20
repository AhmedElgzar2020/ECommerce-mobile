abstract class ECommerceLoginStates {}
class ECommerceLoginInitialState extends ECommerceLoginStates{}
class ECommerceLoginLoadingState extends ECommerceLoginStates{}
class ECommerceLoginSuccessState extends ECommerceLoginStates{
 final dynamic value;

  ECommerceLoginSuccessState(this.value);
}
class ECommerceLoginErrorState extends ECommerceLoginStates{
  final String error;
  ECommerceLoginErrorState(this.error);
}
class ECommerceChangePasswordVisibilityState extends ECommerceLoginStates{}

class NavigatedDone extends ECommerceLoginStates{}




