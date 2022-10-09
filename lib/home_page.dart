import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn_flutter_bloc/models/pizza_model.dart';
import 'package:learn_flutter_bloc/pizza_bloc.dart';
import 'dart:math';

var random = Random();
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("The Pizza BLoC"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: BlocBuilder<PizzaBloc,PizzaState>(
          builder: (context,state){
            if(state is PizzaInitial){
              return CircularProgressIndicator(color: Colors.black,);
            }

            if(state is PizzaLoaded){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${state.pizzas.length}",style: TextStyle(fontSize: 65,fontWeight: FontWeight.bold),),

              SizedBox(height: 20,),

              SizedBox(
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    for(int index = 0;index < state.pizzas.length;index++)
                      Positioned(
                        left: random.nextInt(250).toDouble(),
                          top: random.nextInt(400).toDouble(),
                          child: SizedBox(height: 150,width: 150,
                          child: state.pizzas[index].image,

                          ),


                      ),


                  ],
                ),

              )
            ],
              );
            }else{
              return Text("Something went wrong");
            }
          },
        ),
      ),

      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.black,
            child: Icon(Icons.local_pizza_outlined),
              onPressed: (){
            context.read<PizzaBloc>().add(AddPizza(Pizza.pizzas[0]));
          },
          ),

          FloatingActionButton(
              backgroundColor: Colors.black,
              child: const Icon(Icons.remove),
              onPressed: (){
                context.read<PizzaBloc>().add(RemovePizza(Pizza.pizzas[0]));
              }),

          FloatingActionButton(
            backgroundColor: Colors.black,
            child: const Icon(Icons.local_pizza_outlined),
            onPressed: (){
              context.read<PizzaBloc>().add(AddPizza(Pizza.pizzas[1]));
            },
          ),

          FloatingActionButton(
              backgroundColor: Colors.black,
              child: const Icon(Icons.remove),
              onPressed: (){
                context.read<PizzaBloc>().add(RemovePizza(Pizza.pizzas[1]));
              })

        ],

      ),

    );
  }
}
