import 'package:flutter/material.dart';


class CheckingRegister extends StatelessWidget {
  const CheckingRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child:Form(
        child: Column(
          children:<Widget>[
            const SizedBox(height:200,),
    const Align(
    alignment:Alignment.center,
      child: Text("HÃY NHẤN VÀO ĐƯỜNG LINK ĐÃ GỬI QUA EMAIL ĐỂ KÍCH HOẠT TÀI KHOẢN",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,),
      ),
    ),
            const SizedBox(height:20,),

            ElevatedButton(onPressed:() {
            },
              child: const Text('Đăng Ký'),
            ),

          ],
      ),
    ),
    ),
    );
  }
}
