import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          top: 30.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   height: 20.0,
            // ),
            // Header(),
            // SizedBox(
            //   height: 30.0,
            // ),
            // SocialLinks(),
            // SizedBox(
            //   height: 20,
            // ),
            // SocialLinks1(),
            SizedBox(
              height: 30.0,
            ),
            Flexible(child: Creators()),
          ],
        ),
      ),
    );
  }
}

/*------------------------------------------HEADER----------------------------------------------------------*/

// class Header extends StatelessWidget {
//   const Header({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     Size deviceSize = MediaQuery.of(context).size;
//     return Material(
//       borderRadius: BorderRadius.all(
//         Radius.circular(20.0),
//       ),
//       child: Container(
//         height: deviceSize.height * 0.2,
//         padding: EdgeInsets.symmetric(horizontal: 20.0),
//         decoration: BoxDecoration(
//           image: new DecorationImage(
//             image: new ExactAssetImage('assets/contact.png'),
//             fit: BoxFit.cover,
//           ),
//           borderRadius: BorderRadius.all(
//             Radius.circular(20.0),
//           ),
//         ),
//       ),
//     );
//   }
// }

/*------------------------------------------SOCIAL_LINK----------------------------------------------------------*/

// List<Link> linkCategories = [
//   Link(
//       name: 'Website',
//       icon: icon.AntDesign.link,
//       color: Colors.black,
//       url: ''),
//   Link(
//       name: 'Instagram',
//       icon: icon.AntDesign.instagram,
//       color: Colors.pink,
//       url: ''),
//   Link(
//       name: 'LinkedIn',
//       icon: icon.AntDesign.linkedin_square,
//       color: Colors.blue,
//       url: ''),
//   Link(
//       name: 'Youtube',
//       icon: icon.AntDesign.youtube,
//       color: Colors.red,
//       url: ''),
// ];

class Link {
  String name;
  IconData icon;
  String url;
  Color color;

  Link(
      {required this.icon,
      required this.name,
      required this.url,
      required this.color});
}

// class Category extends StatelessWidget {
//   final Link link;
//
//   Category({super.key, required this.link});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Stack(
//           children: <Widget>[
//             GestureDetector(
//               onTap: () async {
//                 var url = link.url;
//                 if (await canLaunchUrlString(url)) {
//                   await launchUrlString(url,
//                       mode: LaunchMode.externalApplication);
//                 } else {
//                   throw 'Could not launch $url';
//                 }
//               },
//               child: Container(
//                 padding: EdgeInsets.all(10.0),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Color(0xFFF6F5F8),
//                 ),
//                 child: Icon(
//                   link.icon,
//                   color: link.color,
//                   // size: 20.0,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 10.0,
//         ),
//         Text(
//           link.name,
//           style: TextStyle(
//             fontSize: 13.0,
//             fontFamily: 'mont',
//           ),
//         )
//       ],
//     );
//   }
// }

// class SocialLinks extends StatelessWidget {
//   const SocialLinks({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 5.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           for (Link link in linkCategories)
//             Category(
//               link: link,
//             )
//         ],
//       ),
//     );
//   }
// }

/*------------------------------------------SOCIAL_LINK1----------------------------------------------------------*/

// List<Link1> linkCategories1 = [
//   Link1(
//       name: 'Facebook',
//       icon: icon.AntDesign.facebook_square,
//       color: Colors.blueAccent,
//       url: ''),
//   Link1(
//       name: 'Medium',
//       icon: icon.AntDesign.medium_monogram,
//       color: Colors.black,
//       url: ''),
//   Link1(
//       name: 'Twitter',
//       icon: icon.AntDesign.twitter,
//       color: Colors.lightBlue,
//       url: ''),
//   Link1(
//       name: 'E-Mail',
//       icon: icon.AntDesign.mail,
//       color: Colors.deepPurple,
//       url: ''),
// ];

class Link1 {
  String name;
  IconData icon;
  String url;
  Color color;

  Link1(
      {required this.icon,
      required this.name,
      required this.url,
      required this.color});
}

// class Category1 extends StatelessWidget {
//   final Link1 link1;
//
//   Category1({super.key, required this.link1});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Stack(
//           children: <Widget>[
//             GestureDetector(
//               onTap: () async {
//                 // FOR EMAIL ONLY
//                 if (link1.name == "E-Mail") {
//                   final Uri emailLaunchUri = Uri(
//                     scheme: 'mailto',
//                     path: "${link1.url},support@eliteacademy.co.in",
//                     query:
//                         'subject=Regarding Query Related To Elite Academy&body=Jai Hind, Sir/Ma\'am,',
//                   );
//                   if (await canLaunchUrl(emailLaunchUri)) {
//                     await launchUrlString(emailLaunchUri.toString());
//                   } else {
//                     throw 'Could not launch $emailLaunchUri';
//                   }
//                 } else {
//                   var url = link1.url;
//                   if (await canLaunchUrlString(url)) {
//                     await launchUrlString(url,
//                         mode: LaunchMode.externalApplication);
//                   } else {
//                     throw 'Could not launch $url';
//                   }
//                 }
//               },
//               child: Container(
//                 padding: EdgeInsets.all(10.0),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Color(0xFFF6F5F8),
//                 ),
//                 child: Icon(
//                   link1.icon,
//                   color: link1.color,
//                   // size: 20.0,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(
//           height: 10.0,
//         ),
//         Text(
//           link1.name,
//           style: TextStyle(
//             fontSize: 13.0,
//             fontFamily: 'mont',
//           ),
//         )
//       ],
//     );
//   }
// }

// class SocialLinks1 extends StatelessWidget {
//   const SocialLinks1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       //padding: const EdgeInsets.symmetric(horizontal: 55.0),
//       padding: const EdgeInsets.symmetric(horizontal: 5.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           for (Link1 link1 in linkCategories1)
//             Category1(
//               link1: link1,
//             )
//         ],
//       ),
//     );
//   }
// }

/*------------------------------------------CREATORS----------------------------------------------------------*/

class Creators extends StatelessWidget {
  const Creators({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 2,
          ),
          const Text(
            'APP CREATOR',
            textAlign: TextAlign.right,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
                fontFamily: 'poppins'),
          ),
          const SizedBox(
            height: 18,
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              bottom: 20,
              right: 10,
              left: 10,
            ),
            child: MenuItem(
              menu: creator,
            ),
          ),
          const Text(
            'CONTRIBUTORS',
            textAlign: TextAlign.right,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
                fontFamily: 'poppins'),
          ),
          const SizedBox(
            height: 18,
          ),
          for (var contributor in contributorsList)
            SingleChildScrollView(
              padding: const EdgeInsets.only(
                bottom: 20,
                right: 10,
                left: 10,
              ),
              child: MenuItem(
                menu: contributor,
              ),
            ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final ProfileMenu1 menu;
  const MenuItem({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      height: deviceSize.height * 0.14,
      decoration: BoxDecoration(
        boxShadow: [
          const BoxShadow(
            color: Colors.blueAccent,
            blurRadius: 8.0, // has the effect of softening the shadow
            spreadRadius: 1, // has the effect of extending the shadow
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          30.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () async {
                var url = menu.url;
                if (await canLaunchUrlString(url)) {
                  await launchUrlString(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(menu.icon),
                      radius: 25,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          menu.title,
                          style: const TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'mont',
                          ),
                        ),
                        Text(
                          menu.subTitle,
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'mont'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// contributors may add there profile here

List<ProfileMenu1> contributorsList = [
  ProfileMenu1(
    title: '',
    subTitle: 'GitHub: ',
    icon: '',
    url: '',
  ),
];

ProfileMenu1 creator = ProfileMenu1(
  title: 'Gaurav Singh',
  subTitle: 'GitHub: euclidstellar',
  icon: 'assets/images/img_ellipse5_150x150.png',
  url: 'https://github.com/euclidstellar',
);


ProfileMenu1 creator1 = ProfileMenu1(
  title: 'xcrescent',
  subTitle: 'GitHub: xcrescent',
  icon: 'assets/images/img_ellipse5_150x150.png',
  url: 'https://github.com/xcrescent',
);

class ProfileMenu1 {
  String title;
  String subTitle;
  String icon;
  String url;
  ProfileMenu1(
      {required this.icon,
      required this.title,
      required this.subTitle,
      required this.url});
}

class CustomScrollGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, _) {
    return child;
  }
}
