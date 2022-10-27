part of 'contact_cubit.dart';

abstract class ContactState extends Equatable {
  const ContactState();
}

class ContactInitial extends ContactState {
  @override
  List<Object> get props => [];
}

class ContactLoading extends ContactState {
  @override
  List<Object> get props => [];
}

class ContactLoaded extends ContactState {
  final List<Record> records;
  const ContactLoaded(this.records); // Data members

  @override
  List<Object> get props => [records];   // Here we are passing the data, which is required for the UI
}

class ContactLoadError extends ContactState {
  final String errorMessage;

  const ContactLoadError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];

}


// Initial, Loading, LoadSuccess, LoadError