import 'package:flutter/material.dart';


final _formKey = GlobalKey<FormState>();

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.network(" https://s3-alpha-sig.figma.com/img/028a/262f/ff57ce99aa2d1e8a50e46c7a489dc0c7?Expires=1735516800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=Jl7x9iBv~y3ZXnyn-v17K62fNQiMeHs9VRxkIDnzdxBNI1C8eTzg-A3Z23UB-qTw0nLGifH2K-iTVKaqDHq4KoJ8GTLwqhyFIcIZwEH5GZeS3frhXwesUga6-vHYgBfnhw-RxIpxeGVopyukWPjKBYfrzD-dqYLk4rx7CiBKAAXFmplsEf1IN5SQrEEQ4FS2M1V18ZjOHjpkMGDCi61DqkxFbxYbLUTJUP34F97~kB~dvFyqJ74A-nMgR-ogr~O5pl6HbqTX38jTTaZbfzgJqToQ4lBOia~f-uRSKMDkWdmNyCovaErMjlWVPiWfZfX5PBBrMGs6bLP~wA0MkYEu8g__",width: 200,),
        centerTitle: true,
      ),
      body: Center(
        child:Form(
          key: _formKey,
          child: Column(
            children:<Widget>[
              SizedBox(height: 220.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText:'Tên Đăng Nhập',
                  border: OutlineInputBorder(),
                ),
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Vui lòng nhập tên đăng nhập';
                  }
                  return null;
                },

              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Mật Khẩu',
                  border: OutlineInputBorder(),
                ),
                obscureText: true, // Ẩn nội dung mật khẩu
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu';
                  }
                  return null;
                },
              ),
              ////////////
              SizedBox(height: 30,),
              ElevatedButton(onPressed:() {
                if(_formKey.currentState!.validate()){
                  //
                }
              },
                child: Text('Đăng nhập'),
              ),
              ////////
              Align(
              alignment:Alignment.center,
              child: Text("Hãy chọn phương thức đăng nhập khác"),
              ),

              SizedBox(height:160,),
              Align(
                alignment:Alignment.center,
                child: Text("Bạn chưa có tài khoản?"),
              ),

              SizedBox(height:20,),
              ElevatedButton(onPressed:() {},
                child: Text('Đăng Ký'),
              ),
            ],
          ),
        ),

      ),

    );
  }
}



