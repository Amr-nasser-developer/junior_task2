abstract class CurrentStates{}

class CurrentInitial extends CurrentStates{}

class CurrentLoading extends CurrentStates{}

class CurrentSuccess extends CurrentStates{}

class CurrentError extends CurrentStates{
  final error;
  CurrentError(this.error);
}
