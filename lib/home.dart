import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  List<Widget> chats = [
    sendChatItem(image: 'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D', username: 'Ahmed', time: '10:20', message: 'Hello', isSeen: true,hasStory: false, isReceived: true,numberReceivedMessages: 12),
    sendChatItem(image: 'https://images.unsplash.com/photo-1494959764136-6be9eb3c261e?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D', username: 'Doaa', time: '14:20', message: 'Welcome', isSeen: false, hasStory: false,isReceived: false),
    sendChatItem(image: 'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D', username: 'Mina', time: '15:50', message: 'Hello', isSeen: true, hasStory: true,isReceived: true,numberReceivedMessages:1),
    sendChatItem(image: 'https://images.unsplash.com/photo-1494959764136-6be9eb3c261e?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D', username: 'Menna', time: '20:40', message: 'Welcome', isSeen: false,hasStory: false,isReceived: false),
    sendChatItem(image: 'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHBlcnNvbnxlbnwwfHwwfHx8MA%3D%3D', username: 'Mohamed', time: '23:50', message: 'Hello', isSeen: true,hasStory: true,isReceived: true,numberReceivedMessages: 7),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.green,
        elevation: 2,
        centerTitle: false,
        backgroundColor: Colors.green,
        title: Text("Chats",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: chats.length,
        itemBuilder: (BuildContext context, int index) {
        return chats[index];
      },
      ),
    );
  }

 static  Widget sendChatItem({required String image,required String username,required String time,required String message,required bool isSeen,required bool hasStory,required bool isReceived,int numberReceivedMessages = 0}) {
    return  InkWell(
      onTap: (){

      },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Visibility(
                  visible: hasStory,
                  child: CircleAvatar(
                    radius: 34,
                    backgroundColor: Colors.green,
                  ),
                ),
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  backgroundImage: NetworkImage(image),
                ),

              ],
            ),
            SizedBox(width: 10,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                           username,style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 19
                        ),),
                      ),
                      SizedBox(width: 25,),
                      Text(time),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.done_all,color:isSeen ? Colors.blue : Colors.grey,),
                      SizedBox(width: 5,),
                      Expanded(
                        child: Text(
                            maxLines: 1,
                            overflow:TextOverflow.ellipsis,
                            message),
                      ),
                      Visibility(
                        visible: isReceived,
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 10,
                          child: Text(numberReceivedMessages <= 99? "$numberReceivedMessages" : "99+",
                          style: TextStyle(
                            fontSize: 9,color: Colors.white
                          ),),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }


}
