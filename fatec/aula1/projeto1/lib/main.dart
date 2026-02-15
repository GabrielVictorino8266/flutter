import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  static const url = 'https://ufsb.edu.br/progepe/images/phocagallery/galeria2/thumbs/phoca_thumb_l_image03_grd.png';

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3, // Mantemos 3 abas
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("Currículo do Pinguim"),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.person), text: "Sobre"),
                Tab(icon: Icon(Icons.star), text: "Habilidades"),
                Tab(icon: Icon(Icons.contact_mail), text: "Contato"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // --- ABA 1: SOBRE ---
              const AbaSobre(),

              // --- ABA 2: HABILIDADES (Com o seu Card corrigido) ---
              Column(
                children: [
                  Card(
                    elevation: 4, // Adiciona uma sombrinha no card
                    margin: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        // Definimos um tamanho fixo para a imagem não quebrar a Row
                        Image.network(url, width: 80, height: 80, fit: BoxFit.cover),
                        const SizedBox(width: 20), // Espaço entre imagem e texto
                        const Text(
                          "Projetos dos Pinguins",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // --- ABA 3: CONTATO ---
              const Center(child: Text("Página de Contato")),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => print("Web visitada!"),
            child: const Icon(Icons.web),
          ),
        ),
      ),
    );
  }
}

class AbaSobre extends StatelessWidget {
  const AbaSobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: const [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.black12,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          SizedBox(height: 10),
          Text("Desenvolvedor Java & Flutter", style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}