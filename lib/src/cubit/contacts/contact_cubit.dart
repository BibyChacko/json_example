import 'package:bloc/bloc.dart';
import 'package:contact_app/src/cubit/contacts/contact_repository.dart';
import 'package:contact_app/src/models/record.dart';
import 'package:equatable/equatable.dart';

part 'contact_state.dart';

class ContactCubit extends Cubit<ContactState> {
  ContactCubit() : super(ContactInitial());
  final ContactRepository _repository = ContactRepository();

  getRecordsData() async {
    emit(ContactLoading());
    try {
      List<Record> records = await _repository.getRecordsData();
      emit(ContactLoaded(records));
    } catch (ex) {
      print(ex);
      emit(const ContactLoadError("Something went wrong"));
    }
  }

}

// 1. emit the states
// 2. UI will be calling actions in the cubit file on events
// 3. Cubit will give the data back to the UI

// 1. Loading state
// 2. We need to get the data from file --> Repository File -->
