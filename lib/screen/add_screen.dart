import 'package:bloc_rest_api/bloc/post/cubit/postcontact_cubit.dart';
import 'package:bloc_rest_api/data/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_rest_api/di/injection.dart';

class AddScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostcontactCubit>(
      create: (context) => getIt.call(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Contact'),
        ),
        body: BlocBuilder<PostcontactCubit, PostcontactState>(
          builder: (context, state) {
            if(state is PostcontactLodinng){
              return Center(child: CircularProgressIndicator());
            }
            else if(state is PostcontactSuccess){
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Success'),
                    FlatButton(onPressed: (){
                      Navigator.pop(context,'success');
                    }, child: Text('Go Home'))
                  ],
                ),
              );
            }
            else if(state is PostcontactFail){
              return Center(child: Text(state.error));
            }

            return ContactForm();
          },
        ),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  String _name,_age,_job;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(10),
        children: [
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter Name'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please Enter Name';
              }
              return null;
            },
            onSaved: (value){
              this._name = value;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter Age'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please Enter Age';
              }
              return null;
            },
            onSaved: (value){
              this._age = value;
            },
          ),
          SizedBox(height: 10),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(), hintText: 'Enter Job'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please Enter Job';
              }
              return null;
            },
            onSaved: (value){
              this._job = value;
            },
          ),
          SizedBox(height: 10),
          FlatButton(onPressed: (){
            if(_formKey.currentState.validate()){
              _formKey.currentState.save();
              Contact contact = Contact(_name, _job, _age);
              context.bloc<PostcontactCubit>().addContact(contact);
            }

          }, child: Text('Add Contact'))
        ],
      ),
    );
  }
}
