import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:propertio_getx/app/constants/theme.dart';
import 'package:propertio_getx/app/shared/ui/components/button.dart';
import 'package:propertio_getx/app/shared/ui/components/sidebar.dart';
import 'package:propertio_getx/app/shared/ui/components/textfieldForm.dart';
import 'package:propertio_getx/app/shared/ui/widgets/item_angsuran.dart';
import 'package:propertio_getx/app/shared/utils.dart';

import '../controllers/kpr_controller.dart';

class KprView extends GetView<KprController> {
  const KprView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget itemFaq(String title, String message) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        margin: EdgeInsets.only(bottom: 8),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: Text(title, style: primaryTextStyle.copyWith(fontSize: 14)),
            children: [
              Container(
                padding: EdgeInsets.only(left: 16, bottom: 16),
                child: Column(
                  children: [
                    Text(message,
                        style: primaryTextStyle.copyWith(fontSize: 12)),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget faqKpr() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pertanyaan Terkait KPR',
              style: primaryTextStyle.copyWith(fontWeight: bold, fontSize: 16)),
          SizedBox(height: 8),
          itemFaq('Apa yang dimaksud dengan KPR ?',
              'KPR adalah singkatan dari Kredit Pemilikan Rumah, yaitu suatu fasilitas kredit yang diberikan oleh perbankan kepada nasabah perorangan yang ingin membeli atau memperbaiki rumah. KPR memungkinkan nasabah untuk membayar rumah secara cicilan dalam jangka waktu dan bunga tertentu sesuai dengan perjanjian dengan bank. Ada dua jenis KPR yang tersedia di Indonesia, yaitu KPR subsidi dan KPR non-subsidi. KPR subsidi adalah kredit yang diperuntukkan bagi masyarakat berpenghasilan rendah dengan bunga yang lebih rendah dan syarat yang lebih mudah. KPR non-subsidi adalah kredit yang bisa digunakan oleh seluruh masyarakat dengan bunga dan syarat yang ditentukan oleh bank.'),
          itemFaq('Apa saja jenis suku bunga KPR?',
              'Secara umum, ada dua jenis suku bunga KPR yang diberlakukan bank, yaitu: Fixed rate, Floating rate. Suku bunga tetap dikenakan kepada debitur menggunakan patokan angka tertentu selama tenor yang telah ditentukan. Besar bunga yang ditetapkan kepada debitur mengikuti fluktuasi suku bunga acuan (BI rate).'),
        ],
      );
    }

    Widget form() {
      return Column(
        children: [
          CustomTextField(
              isNumber: true,
              title: 'Harga Properti',
              hintText: 'Harga Properti',
              mandatory: false,
              controller: controller.propertyPriceController,
              prefix:
                  Text("Rp. ", style: primaryTextStyle.copyWith(fontSize: 16))),
          SizedBox(height: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() => Column(
                    children: [
                      IgnorePointer(
                        ignoring: true,
                        child: CustomTextField(
                          isNumber: true,
                          controller: controller.interestRateController,
                          title: 'Suku Bunga',
                          hintText: 'Suku Bunga',
                          mandatory: false,
                          suffix: Text('%',
                              style: primaryTextStyle.copyWith(fontSize: 18)),
                        ),
                      ),
                      SizedBox(height: 8),
                      Slider(
                        min: 1,
                        max: 15,
                        divisions: 15,
                        label: '${controller.sliderVal.value}%',
                        thumbColor: Colors.white,
                        value: controller.sliderVal.toDouble(),
                        onChanged: (newValue) {
                          controller.setSliderVal(newValue.toInt());
                        },
                        // 14
                        activeColor: primaryColor,
                        inactiveColor: secondaryColor,
                      ),
                    ],
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Text('1%', style: primaryTextStyle.copyWith(fontSize: 12)),
                    Spacer(),
                    Text('15%', style: primaryTextStyle.copyWith(fontSize: 12)),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Uang Muka',
                style: primaryTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
              Row(
                children: [
                  Obx(() => Container(
                        width: 100,
                        child: CustomTextField(
                          isNumber: true,
                          controller: TextEditingController(
                              text:
                                  '${controller.downPaymentPercen.value.toStringAsFixed(2)}'),
                          suffix: Text('%',
                              style: primaryTextStyle.copyWith(fontSize: 18)),
                          hintText: 'Persen',
                        ),
                      )),
                  SizedBox(width: 8),
                  Expanded(
                      child: CustomTextField(
                    isNumber: true,
                    prefix: Text("Rp. ",
                        style: primaryTextStyle.copyWith(fontSize: 16)),
                    hintText: 'Rp.100.000.000',
                    controller: controller.downPaymentController,
                    onChanged: (value) {
                      controller.setDownPaymentPercen(value);
                    },
                  )),
                ],
              ),
              SizedBox(height: 8),
              CustomTextField(
                isNumber: true,
                suffix: Text('Tahun',
                    style: primaryTextStyle.copyWith(fontSize: 16)),
                controller: controller.loanTermController,
                title: 'Jangka Waktu',
                hintText: 'Jangka Waktu',
                mandatory: false,
              ),
              SizedBox(height: 8),
              CustomButton(
                  text: 'Mulai Simulasikan',
                  onPressed: () {
                    controller.validateForm();
                  }),
              SizedBox(height: 8),
              CustomButton(
                  color: Colors.grey,
                  text: 'Reset',
                  onPressed: () {
                    controller.resetFormKpr();
                  }),
            ],
          ),
        ],
      );
    }

    Widget ringkasan(
      String pinjamanPokok,
      String bungaPinjaman,
      String totalPinjaman,
    ) {
      return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xffE6E6E6),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ringkasan :',
                style:
                    primaryTextStyle.copyWith(fontWeight: bold, fontSize: 16)),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Pinjaman Pokok',
                    style: primaryTextStyle.copyWith(fontSize: 12)),
                Text(pinjamanPokok,
                    style: primaryTextStyle.copyWith(
                        fontSize: 12, fontWeight: bold)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Bunga Pinjaman (${controller.loanTermController.text} Tahun)',
                    style: primaryTextStyle.copyWith(fontSize: 12)),
                Text(bungaPinjaman,
                    style: primaryTextStyle.copyWith(
                        fontSize: 12, fontWeight: bold)),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Pinjaman',
                    style: primaryTextStyle.copyWith(fontSize: 12)),
                Text(totalPinjaman,
                    style: primaryTextStyle.copyWith(
                        fontSize: 12, fontWeight: bold)),
              ],
            ),
            SizedBox(height: 8),
          ],
        ),
      );
    }

    Widget listAngsuran() {
      return Obx(() {
        if (controller.isCalculated.value) {
          return Column(
            children: [
              ringkasan(
                  formatCurrencyDouble(controller
                      .loanSimulationResult.value.summaryPrincipalLoan!),
                  formatCurrencyDouble(controller
                      .loanSimulationResult.value.summaryInterestPrice!),
                  formatCurrencyDouble(
                      controller.loanSimulationResult.value.summaryTotalLoan!)),
              SizedBox(height: 12),
              // GridView(
              //     gridDelegate:
              //         SliverGridDelegateWithFixedCrossAxisCount(
              //             crossAxisCount: 2,
              //             crossAxisSpacing: 10,
              //             mainAxisSpacing: 10,
              //             childAspectRatio: 1.3),
              //     shrinkWrap: true,
              //     physics: NeverScrollableScrollPhysics(),
              //     children: controller.loanSimulationResult.value.installmentByYear!
              //         .map((e) => ItemAngsuran(
              //             formatCurrencyDouble(e.installment!),
              //             e.year.toString(),
              //             isSelected: loanTermController.text ==
              //                     e.year.toString()
              //                 ? true
              //                 : false))
              //         .toList())
              Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: controller
                      .loanSimulationResult.value.installmentByYear!
                      .map((e) => ItemAngsuran(
                          formatCurrencyDouble(e.installment!),
                          e.year.toString(),
                          isSelected: controller.loanTermController.text ==
                                  e.year.toString()
                              ? true
                              : false))
                      .toList())
            ],
          );
        } else {
          return Container();
        }
      });
    }

    return Scaffold(
        appBar: propertioAppBar(),
        drawer: SideBar(),
        body: Container(
          color: bgColor1,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: ListView(
            children: [
              Image.asset('assets/img_kpr.png'),
              SizedBox(height: 16),
              form(),
              SizedBox(height: 16),
              listAngsuran(),
              SizedBox(height: 16),
              faqKpr(),
            ],
          ),
        ));
  }
}
