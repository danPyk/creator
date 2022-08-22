import 'package:creator/creator/back/creator_vm.dart';
import 'package:creator/creator/front/radio_button.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class RadioWidget extends ViewModelWidget<CreatorVM> {
  const RadioWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CreatorVM viewModel) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0, bottom: 4.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(
                20) // use instead of BorderRadius.all(Radius.circular(20))
            ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RadioButton(
                'Pendant',
                () {

                  viewModel.setEnum(SelectedEnum.pendant);

                  viewModel.updateRightButton(viewModel.selectedEnum);
                  viewModel.updateElementsList(viewModel.selectedEnum);
                },
                color: viewModel.pendantColor,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: RadioButton(
                  'Chain',
                  () {

                    viewModel.setEnum(SelectedEnum.chain);
                    viewModel.updateRightButton(viewModel.selectedEnum);
                    viewModel.updateElementsList(viewModel.selectedEnum);

                  },
                  color: viewModel.chainColor,
                ),
              ),
              RadioButton(
                'Plus',
                () {

                  viewModel.setEnum(SelectedEnum.plus);

                  viewModel.updateRightButton(viewModel.selectedEnum);
                  viewModel.updateElementsList(viewModel.selectedEnum);

                },
                color: viewModel.plusColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
