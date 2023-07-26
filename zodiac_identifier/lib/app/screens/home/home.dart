import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zodiac_identifier/app/core/base_state/base_state.dart';
import 'package:zodiac_identifier/app/core/ui/styles/text_app.dart';
import 'package:zodiac_identifier/app/screens/home/home_controller.dart';
import 'package:zodiac_identifier/app/screens/home/home_state.dart';
import 'package:zodiac_identifier/app/screens/home/widgets/button.dart';
import 'package:zodiac_identifier/app/screens/home/widgets/constellation_loaded.dart';
import 'package:zodiac_identifier/app/screens/home/widgets/initial.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends BaseState<Home, HomeController> {
  bool _state = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Seja bem-vindo ao',
              style: context.text.appBar,
            ),
            Text(
              'Zodiac Identifier',
              style: context.text.titleAppBar,
            )
          ],
        ),
        actions: [
          Image.asset(
            'assets/images/stars.png',
            width: 60,
          ),
        ],
      ),

      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          state.status.matchAny(
            any: () => hideLoader(),
            loadedImage: () {
              _state = true;
              showSuccess('Imagem carregada com sucesso!');
            },
            loading: () => showLoader(),
            loaded: () {
              _state = true;
              showSuccess('Identificação realizada com sucesso!');
              hideLoader();
            },
            error: () {
              _state = false;
              hideLoader();
              showErro(state.errorMessage ?? 'Erro não informado');
            },
          );
        },

        builder: (context, state) {
          final image = state.galleryFile;
          final constellation = state.constellation;

          return Padding(
            padding: const EdgeInsets.only(right: 16.0, left: 16.0, bottom: 8.0),
            
            child: Stack(
              children: [
                Visibility(
                  visible: image != null,

                  replacement: Initial(function: () => controller.pickImage()),

                  child: ConstellationLoaded(
                    image: image,
                    constellation: constellation,
                    status: _state,
                  ),
                ),

                Align(
                  alignment: Alignment.bottomCenter,

                  child: Visibility(
                    visible: constellation == null && _state,

                    replacement: Button(
                      title: 'SELECIONE UMA NOVA IMAGEM',
                      function: () => controller.pickImage(),
                    ),

                    child: Button(
                      title: image != null
                          ? 'IDENTIFICAR'
                          : 'SELECIONE UMA IMAGEM',

                      function: () => image != null
                          ? controller.identify(state.encodeImage!)
                          : controller.pickImage(),
                    ),
                  ),
                ),
              ],
            )
          );
        },
      ),
    );
  }
}
