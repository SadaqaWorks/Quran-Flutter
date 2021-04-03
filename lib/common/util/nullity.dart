library nullity;

// typedef T LetCallback<T>(T value);
//
// T let<T>(T value, LetCallback<T> cb) {
//   if (value != null) {
//     return cb(value);
//   }
// }

ReturnType run<ReturnType>(ReturnType Function() operation) {
  return operation();
}

extension ScopeFunctionsForObject<T extends Object> on T {
  ReturnType let<ReturnType>(ReturnType Function(T self) operationFor) {
    return operationFor(this);
  }

  T also(void Function(T self) operationFor) {
    operationFor(this);
    return this;
  }
}
//USAGE:
// bool handle(Shop selectedShop) {
//   return selectedShop?.let((shop) {
//     navigateTo(shop.location);
//     return true;
//   }) ?? run(() {
//     navigateToDefaultPosition();
//     return false;
//   });
// }

//someNullable?.let((it) { ... });

//Used for additional actions that don't alter the object, such as logging or printing debug information.
//something.also((it) { ... }); // returns something.

//RUN
//someNullable ?? run(() {
//   var defaultValue = ......;
//   // several process...
//
//   return defaultValue;
// });

// resourcesString?.let((it) {
//
// }) ?? run(()  {
//
// });
