import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home() // home chama tela principal com a classe stateless home
      ));
}

class Home extends StatelessWidget {
  const Home({super.key}); // construtor

  @override
  Widget build(BuildContext context) {
    // reconstruir a nossa tela
    // Criar Scaffold
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "VIAJE BEM!",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.justify,
          ),
        ),
        backgroundColor:
            Color.fromARGB(255, 0, 255, 166), // título do nosso aplicativo
      ),
      body: ListView(
        children: [
          Destino("Angra do Reis", "imagens/angra.jpg", 384, 70),
          Destino("Arraial do Cabo", "imagens/arraial.jpg", 571, 65),
          Destino("Florianopolis", "imagens/flori.jpg", 348, 85),
          Destino("Jericoacoara", "imagens/jeri.jpg", 571, 75),
          Destino("Chile", "imagens/chile.jpg", 446, 95),
          Destino("Madrid", "imagens/madri.jpg", 401, 85),
          Destino("Paris", "imagens/paris.jpg", 546, 95),
          Destino("Roma", "imagens/roma.jpg", 478, 85),
          Destino("Orlando", "imagens/orlando.jpg", 616, 105),
          Destino("LasVegas", "imagens/lasvegas.jpg", 504, 110),
        ],
      ),
    );
  }
}

class Destino extends StatefulWidget {
  final String nomedestino; // cria variáveis para passar o nome do Destino
  final String img; // cria variável para passar o caminho da imagem
  final int valor;
  final int pessoas;
  Destino(this.nomedestino, this.img, this.valor, this.pessoas,
      {super.key}); // construtor para passagem de parâmetros

  @override
  State<Destino> createState() => _Destino();
}

class _Destino extends State<Destino> {
  int cont = 0;
  int n_diarias = 0;
  int total = 0;

  void _dias() {
    // função set state monitora o estado das variáveis da classe statefull
    setState(() {
      n_diarias++;
    });
  }

  void _n_pessoas() {
    setState(() {
      cont++;
    });
  }

  void _limpar() {
    setState(() {
      cont = 0;
      n_diarias = 0;
      total = 0;
    });
  }

  void _calc() {
    setState(() {
      total = (cont * widget.pessoas) + (n_diarias * widget.valor);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        //deixar o cursor em cima do container e apertar cotrl ponto(.) e selecionar (wrap with column)
        color: Colors.blue,
        width: 393,
        height: 250,
        child: Image.asset(
          widget
              .img, // utiliza o widget para chamar a variável img pois ela está fora dessa classe
          fit: BoxFit.fill, // ajuste da imagem do container
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "${widget.nomedestino}",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "R\$ ${widget.valor}/dia",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "R\$ ${widget.pessoas}/pessoa",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Quantidade de dias: $n_diarias",
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.start,
            ),
            ElevatedButton(
              onPressed: _dias,
              child: Icon(Icons.add),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 113, 215, 177),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Quantidade de pessoas: $cont",
              style: TextStyle(fontSize: 21),
              textAlign: TextAlign.start,
            ),
            ElevatedButton(
              onPressed: _n_pessoas,
              child: Icon(Icons.add),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 113, 215, 177)),
            )
          ],
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Valor total: R\$ $total",
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: _calc,
              child: Text("calcular"),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 0, 0, 0)),
            ),
            ElevatedButton(
              onPressed: _limpar,
              child: Text("limpar"),
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 0, 0, 0)),
            ),
          ],
        ),
      )
    ]);
  }
}
