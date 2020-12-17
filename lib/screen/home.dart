import 'package:bloc_rest_api/bloc/get/cubit/getcontact_cubit.dart';
import 'package:bloc_rest_api/data/database/contact_dao.dart';
import 'package:bloc_rest_api/data/model/contact.dart';
import 'package:bloc_rest_api/di/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'add_screen.dart';
import 'edit_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'save',
            child: Icon(Icons.save),
            onPressed: () async {

            },
          ),
          SizedBox(width: 30,),
          FloatingActionButton(
            heroTag: 'add',
            child: Icon(Icons.add),
            onPressed: () async {
              var result = await Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => AddScreen()));
              if (result != null && result == 'success') {
                BlocProvider.of<GetContactCubit>(context).getContact();
              }
            },
          ),
        ],
      ),
      body: BlocBuilder<GetContactCubit, GetContactState>(
        builder: (context, state) {
          if (state is GetContactSuccess) {
            List<Contact> contacts = state.contacts;
            return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, position) {
                  return item(contacts[position], context);
                });
          } else if (state is GetContactFail) {
            return Center(child: Text('${state.error}'));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget item(Contact contact, BuildContext context) {
    return Card(
      child: Slidable(
        actionPane: SlidableDrawerActionPane(),
        actions: [
          IconSlideAction(
            icon: Icons.edit,
            color: Colors.blue,
            onTap: () async {
              var result = await Navigator.push(context,
                  MaterialPageRoute(builder: (_) => EditScreen(contact)));
              if (result != null && result == 'success') {
                BlocProvider.of<GetContactCubit>(context).getContact();
              }
            },
          )
        ],
        secondaryActions: [
          IconSlideAction(
            icon: Icons.delete,
            color: Colors.red,
            onTap: () {
              context.bloc<GetContactCubit>().delete(contact.id);
            },
          )
        ],
        child: ListTile(
          onTap: _getData(contact),
          leading: IconButton(icon: Icon(Icons.save,color: Colors.blue,),
          onPressed: _saveData(contact)
          ),
          title: Text(contact.name),
          subtitle: Text(contact.job),
          trailing: Text('age ${contact.age}'),
        ),
      ),
    );
  }
  _saveData(Contact contact) {
    ContactDao contactDao =  getIt.call();
    contactDao.addContact(contact);

  }
  _getData(Contact contact) {
    ContactDao contactDao =  getIt.call();
    contactDao.getContactById(contact.id).then((value) => print(value));

  }

}
