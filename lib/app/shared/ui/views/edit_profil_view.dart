// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:propertio_mobile/bloc/address/cities/cities_cubit.dart';
// import 'package:propertio_mobile/bloc/address/province/province_cubit.dart';
// import 'package:propertio_mobile/bloc/profile/profile_bloc.dart';
// import 'package:propertio_mobile/data/model/request/udpate_profil_request_model.dart';

// import 'package:propertio_mobile/data/model/responses/address_response_model.dart';
// import 'package:propertio_mobile/data/model/responses/profil_response_model.dart';
// import 'package:propertio_mobile/shared/api_path.dart';
// import 'package:propertio_getx/app/constants/theme.dart';
// import 'package:propertio_mobile/ui/component/bottom_modal.dart';
// import 'package:propertio_getx/app/shared/ui/components/button.dart';
// import 'package:propertio_mobile/ui/component/dropdown_type.dart';
// import 'package:propertio_mobile/ui/component/text_failure.dart';
// import 'package:propertio_mobile/ui/component/textfieldForm.dart';

// class ModalEditProfile extends StatefulWidget {
//   ProfilResponseModel profil;
//   ModalEditProfile(this.profil, {super.key});

//   @override
//   State<ModalEditProfile> createState() => _ModalEditProfileState();
// }

// class _ModalEditProfileState extends State<ModalEditProfile> {
//   ProvinceResponseModel selectedProvince =
//       ProvinceResponseModel(id: '0', name: 'Pilih Provinsi');
//   CitiesResponseModel selectedCity =
//       CitiesResponseModel(id: '0', name: 'Pilih Kota');

//   String? _selectedProvince;
//   String? _selectedCity;

//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController phoneController = TextEditingController();
//   TextEditingController addressController = TextEditingController();
//   File? _image;
//   void _pickImage() async {
//     final picker = ImagePicker();
//     final pickedImage = await picker.pickImage(source: ImageSource.gallery);

//     setState(() {
//       if (pickedImage != null) {
//         _image = File(pickedImage.path);
//       }
//     });
//   }

//   @override
//   void initState() {
//     context.read<CitiesCubit>().disposeCity();
//     nameController.text = widget.profil.data!.userData!.fullName!;
//     emailController.text = widget.profil.data!.email!;
//     phoneController.text = widget.profil.data!.userData!.phone!;
//     addressController.text = widget.profil.data!.userData!.address!;
//     _selectedProvince = widget.profil.data!.userData!.province;
//     _selectedCity = widget.profil.data!.userData!.city;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget getProvince() {
//       return BlocBuilder<ProvinceCubit, ProvinceState>(
//         builder: (context, state) {
//           if (state is ProvinceLoading) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           if (state is ProvinceError) {
//             return TextFailure(message: state.message);
//           }
//           if (state is ProvinceLoaded) {
//             List<ProvinceResponseModel> provinces = state.provinces;

//             return CustomDropdown<String>(
//               value: _selectedProvince!,
//               items: provinces.map((e) => '${e.name}').toList(),
//               label: 'Provinsi',
//               onChanged: (value) {
//                 setState(() {
//                   var idProvince = provinces
//                       .firstWhere((element) => element.name == value)
//                       .id;
//                   _selectedProvince = value;
//                   context.read<CitiesCubit>().disposeCity();
//                   _selectedCity = 'Pilih Kota';
//                   print(value);
//                   print('$idProvince');
//                   context.read<CitiesCubit>().getCities('$idProvince');
//                 });
//               },
//               itemBuilder: (item) {
//                 return DropdownMenuItem(
//                   value: item,
//                   child: Text('${item}'),
//                 );
//               },
//             );
//           }
//           return Container();
//         },
//       );
//     }

//     Widget getCity() {
//       return BlocBuilder<CitiesCubit, CitiesState>(
//         builder: (context, state) {
//           if (state is CitiesLoading) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           if (state is CitiesError) {
//             return TextFailure(message: state.message);
//           }
//           if (state is CitiesLoaded) {
//             List<CitiesResponseModel> cities = state.cities;

//             return CustomDropdown<String>(
//               value: _selectedCity!,
//               items: cities.map((e) => '${e.name}').toList(),
//               label: 'Kota',
//               onChanged: (value) {
//                 setState(() {
//                   _selectedCity = value;
//                 });
//               },
//               itemBuilder: (item) {
//                 return DropdownMenuItem(
//                   value: item,
//                   child: Text('${item}'),
//                 );
//               },
//             );
//           }
//           return IgnorePointer(
//             ignoring: true,
//             child: CustomDropdown<String>(
//               value: _selectedCity!,
//               items: [_selectedCity!],
//               label: 'Kota',
//               onChanged: (value) {
//                 setState(() {
//                   _selectedCity = value;
//                 });
//               },
//               itemBuilder: (item) {
//                 return DropdownMenuItem(
//                   value: item,
//                   child: Text('${item}'),
//                 );
//               },
//             ),
//           );
//         },
//       );
//     }

//     Widget formEditProfile() {
//       return Column(
//         children: [
//           SizedBox(height: 24),
//           Text(
//             'Ubah Data Profil',
//             style: primaryTextStyle.copyWith(
//               fontSize: 16,
//               fontWeight: semiBold,
//             ),
//           ),
//           SizedBox(height: 16),
//           GestureDetector(
//             onTap: _pickImage,
//             child: _image == null
//                 ? CircleAvatar(
//                     radius: 60,
//                     backgroundImage: NetworkImage(
//                       ApiPath.image(
//                           '${widget.profil.data!.userData!.pictureProfile}'),
//                       scale: 1.0,
//                     ),
//                   )
//                 : CircleAvatar(
//                     radius: 60,
//                     backgroundImage: FileImage(_image!, scale: 1.0),
//                     // child:
//                     //     _image == null ? Icon(Icons.add_a_photo, size: 40) : null,
//                   ),
//           ),
//           SizedBox(height: 20),
//           CustomTextField(
//             controller: nameController,
//             title: 'Nama Lengkap',
//             mandatory: true,
//             hintText: 'Masukan Nama Lengkap Anda',
//           ),
//           CustomTextField(
//             controller: emailController,
//             title: 'Email',
//             mandatory: true,
//             hintText: 'Masukan Email Anda',
//           ),
//           CustomTextField(
//             controller: phoneController,
//             title: 'Nomor Telepon',
//             mandatory: true,
//             hintText: 'Masukan Nomor Teleopon Anda',
//           ),
//           getProvince(),
//           getCity(),
//           CustomTextField(
//             controller: addressController,
//             title: 'Alamat',
//             mandatory: true,
//             hintText: 'Masukan Alamat Anda',
//           ),
//           BlocConsumer<ProfileBloc, ProfileState>(
//             listener: (context, state) {
//               if (state is ProfileSuccess) {
//                 // context.read<ProfileBloc>().add(OnGetProfile());
//                 // showMessageModal(context, 'Berhasil ,Data berhasil diubah',
//                 //     color: Colors.green);
//                 succsessDialog(context, 'Berhasil ,Data berhasil diubah',
//                     () => Navigator.pop(context));
//                 // Navigator.pop(context);
//               }
//               if (state is ProfileError) {
//                 showMessageModal(context, state.message);
//               }
//             },
//             builder: (context, state) {
//               if (state is ProfileLoading) {
//                 return Center(child: CircularProgressIndicator());
//               }
//               return CustomButton(
//                   text: 'Simpan',
//                   onPressed: () {
//                     final updateProfil = UpdateProfilRequestModel(
//                         fullName: nameController.text,
//                         email: emailController.text,
//                         phone: phoneController.text,
//                         address: addressController.text,
//                         province: _selectedProvince!,
//                         city: _selectedCity!,
//                         pictureProfileFile: _image);
//                     context
//                         .read<ProfileBloc>()
//                         .add(OnUpdateProfil(updateProfil));
//                   });
//             },
//           )
//         ],
//       );
//     }

//     return Scaffold(
//       body: SafeArea(
//           child: Container(
//               width: MediaQuery.of(context).size.width,
//               padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
//               child: ListView(
//                 children: [
//                   formEditProfile(),
//                 ],
//               ))),
//     );
//   }
// }
