import 'package:bloc_rest_api/bloc/get/cubit/getcontact_cubit.dart';
import 'package:bloc_rest_api/bloc/put/cubit/editcontact_cubit.dart';
import 'package:bloc_rest_api/data/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_rest_api/di/injection.dart';

class EditScreen  extends StatelessWidget {
  final Contact _contact;
  EditScreen(this._contact);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditContactCubit>(
      create: (context) => getIt.call(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Edit Contact'),
        ),
        body: BlocBuilder<EditContactCubit, EditContactState>(
          builder: (context, state) {
            if(state is EditContactLoading){
              return Center(child: CircularProgressIndicator());
            }
            else if(state is EditContactSuccess){
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
            else if(state is EditContactFail){
              return Center(child: Text(state.error));
            }

            return ContactForm(this._contact);
          },
        ),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  final Contact _contact;
  ContactForm(this._contact);
  @override
  _ContactFormState createState() => _ContactFormState(this._contact);
}

class _ContactFormState extends State<ContactForm> {
  final Contact _contact;
  _ContactFormState(this._contact);
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
            initialValue: _contact.name,
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
            initialValue: _contact.age,
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
            initialValue: _contact.job,
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
              Contact contact = Contact( _name, _job, _age,id: _contact.id);
              context.bloc<EditContactCubit>().edit(_contact.id, contact);
            }

          }, child: Text('Edit Contact'))
        ],
      ),
    );
  }
}
