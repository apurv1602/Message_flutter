import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        useMaterial3: true,
        drawerTheme: const DrawerThemeData(
          scrimColor: Colors.transparent
        )
      ),
      home: const MyHomePage(title: 'Login '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _globalKey= GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
     backgroundColor: const Color(0xFF171717),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50,left: 10 ,right:0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(onPressed: (){
                      _globalKey.currentState!.openDrawer();
                    }, icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    )),
                    IconButton(onPressed: (){}, icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ))
                  ],
                ),
              ),
              SizedBox(
                height: 50,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 10),
                  children: [
                    TextButton(onPressed: (){},
                        child: const Text(
                          "Messages", style: TextStyle(color: Colors.white,fontSize: 24,fontWeight: FontWeight.w700),
                        )),
                    const SizedBox(width: 35),
                    TextButton(onPressed: (){},
                        child: const Text(
                          "Online", style: TextStyle(color: Colors.grey,fontSize: 24,fontWeight: FontWeight.w700),
                        )),
                    const SizedBox(width: 35),
                    TextButton(onPressed: (){},
                        child: const Text(
                          "Group", style: TextStyle(color: Colors.grey,fontSize: 24,fontWeight: FontWeight.w700),
                        )),
                    const SizedBox(width: 35),
                    TextButton(onPressed: (){},
                        child: const Text(
                          "More", style: TextStyle(color: Colors.grey,fontSize: 24,fontWeight: FontWeight.w700),
                        )),
                    const SizedBox(width: 35),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            top: 160,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(top: 15,left: 25, right: 25),
                height: 220,
                decoration: const BoxDecoration(
                  color: Color(0xFF27c1a9),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Favorite contact",style: TextStyle(
                          color: Colors.white,
                        ),),
                        IconButton(onPressed: (){}, icon: const Icon(
                          Icons.more_horiz,
                          color: Colors.white,
                        ))
                      ],
                    ),
                    SizedBox(height: 95,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                      children: [
                        buildContactAvatar('Shelby', 'aaa.jpg'),
                        buildContactAvatar('Alex', 'nft.png'),
                        buildContactAvatar('Apurv', 'asd.jpg'),
                        buildContactAvatar('Bob', 'th.jpg'),
                        buildContactAvatar('Adam', 'nft3.png')
                      ],
                    )),
                  ],

                ),
          )
          ),
          Positioned(
            top: 340,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                height: 200,
                decoration: const BoxDecoration(
                  color: Color(0xFFEFFFFC),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: ListView(
                  padding: const EdgeInsets.only(left: 25),
                  children: [
                    buildConversationRow('Apurv','Hello, how are you?','asd.jpg',4),
                    buildConversationRow('Bob','Hello, how are you?','th.jpg',0),
                    buildConversationRow('Alex','Hello, how are you?','nft.png',2),
                    buildConversationRow('Shelby','Hello, how are you?','aaa.jpg',5),
                    buildConversationRow('Adam','Hello, how are you?','nft3.png',0),
                    buildConversationRow('apurv','Hello, how are you?','asd.jpg',4),
                    buildConversationRow('apurv','Hello, how are you?','asd.jpg',4),
                  ],
                ),
              ))

        ],
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: SizedBox(
        height: 65,
        width: 65,
        child: FloatingActionButton(
          shape: const CircleBorder(),
        backgroundColor: const Color(0xFF27c1a9),
        child:const Icon(Icons.edit_outlined,size: 30,color: Colors.white,),
        onPressed: (){},
      ),
      ),

      drawer:  Drawer(
        width: 275,
        elevation: 30,
        backgroundColor: Colors.black38,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.horizontal(right: Radius.circular(40))
        ),

        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xF71F1E1E),
              borderRadius: BorderRadius.horizontal(right: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3D000000),spreadRadius: 30,blurRadius: 20
                )
              ]
          ),
          child: const Padding(
            padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                  children: [
                    Icon(Icons.arrow_back_ios,color: Colors.white,size: 20),
                    SizedBox(width:56),
                    Text('Setting',style: TextStyle(color: Colors.white,fontSize: 16),),
                  ],
                ),
                    SizedBox(height: 30,),
                    Row(
                      children:  [
                        UserAvatar(filename: 'aaa.jpg'),
                        SizedBox(width: 12),
                        Text('tommy shelby',style: TextStyle(color:Colors.white),),
                      ],
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    DrawerItem(title:'account',icon:Icons.key),
                    DrawerItem(title: "chats", icon: Icons.chat_bubble),
                    DrawerItem(title: 'Notification', icon: Icons.notifications),
                    DrawerItem(title: 'data and storage', icon: Icons.storage),
                    DrawerItem(title: 'Help', icon: Icons.help),
                    Divider(height: 35, color: Colors.green,),
                    DrawerItem(title: 'Invite a friend', icon: Icons.people_outline),
                  ],
                ),
                DrawerItem(title: 'Log Out', icon: Icons.logout)
              ],
            ),
          ),
        ),
      ),
    );
  }




  Column buildConversationRow(String name,String message,String filename,int msgcount){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [

                UserAvatar(filename: filename),
                const SizedBox(width: 15,),
                 Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(color: Colors.black),),
                    const SizedBox(height: 3,),
                    Text(message, style: const TextStyle(color: Colors.black),)

                  ],
                )
              ],
            ),
             Padding(
              padding: const EdgeInsets.only(right:25,top: 5 ),
              child: Column(
                children: [
                  const Text('16:35', style: TextStyle(fontSize:10 ),),
                  const SizedBox(height:10 ,),

                  if(msgcount>0)
                  CircleAvatar(radius: 7, backgroundColor: const Color(0xFF27c1a9),
                    child: Text(msgcount.toString() ,style: const TextStyle(fontSize: 10,color: Colors.white),
                    ),)
                ],

              ),
            )
          ],
        ),
        const Divider(
          indent:75,
        )
      ],
    );
  }




Padding buildContactAvatar(String name,String filename){
  return Padding(
    padding:  const EdgeInsets.only(right: 20),
    child: Column(
      children: [
        UserAvatar(filename: filename),
         const SizedBox(height: 5),
         Text(name,style: const TextStyle(color: Colors.white,fontSize: 16,),),
      ],
    ),
  );
  }
}

class DrawerItem extends StatelessWidget{
  final String title;
  final IconData icon;
  const DrawerItem({super.key, required this.title, required this.icon});
  @override
  Widget build(BuildContext context){
    return  InkWell(
      onTap: (){

      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Row(
          children:  [
            Icon(icon,color: Colors.white,size: 20),const SizedBox(width:40),
            Text(title,style: const TextStyle(color: Colors.white,fontSize: 16),),
          ],
        ),
      ),
    );
  }
}


class UserAvatar extends StatelessWidget {
  final String filename;

   const UserAvatar({Key? key, required this.filename}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      radius: 32,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 29,
         backgroundImage: Image.asset('assets/images/$filename').image,
      ),
    );
  }
}
