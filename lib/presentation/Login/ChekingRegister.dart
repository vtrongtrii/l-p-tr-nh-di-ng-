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
            SizedBox(height:200,),
    Align(
    alignment:Alignment.center,
      child: Text("HÃY NHẤN VÀO ĐƯỜNG LINK ĐÃ GỬI QUA EMAIL ĐỂ KÍCH HOẠT TÀI KHOẢN",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,),
      ),
    ),
            SizedBox(height:20,),

            ElevatedButton(onPressed:() {
            },
              child: Text('Đăng Ký'),
            ),

          ],
      ),
    ),
    ),
    );
  }
}
