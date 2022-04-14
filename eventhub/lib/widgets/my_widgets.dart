// import 'package:flutter/cupertino.dart';
// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:eventhub/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

Widget community1st({title, path, style}) {
  return Row(
    children: [
      path.toString().isEmpty
          ? Container(
              width: 24,
              height: 24,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blue),
              child: const Icon(
                Icons.person,
                color: Colors.white,
              ),
            )
          : Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(path), fit: BoxFit.fill)),
            ),
      const SizedBox(
        width: 10,
      ),
      myText(text: title, style: style)
    ],
  );
}

Widget completeCommunityWidget({
  imagePath,
  imageTitle,
  imagePath1,
  imageTitle1,
  centerImage,
  lastTitle,
  imagePath2,
  imageTitle2,
}) {
  return Column(
    children: [
      Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                community1st(
                  path: imagePath,
                  title: imageTitle,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff333333),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Image.asset(imagePath1),
                    const SizedBox(
                      width: 10,
                    ),
                    myText(
                      text: imageTitle1,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff303030),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    centerImage,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                community1st(
                  path: imagePath2,
                  title: imageTitle2,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff939394),
                  ),
                ),
                myText(
                    text: lastTitle,
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ))
              ],
            ),
          ),
        ],
      ),
      const Divider()
    ],
  );
}

Widget elevatedButton({text, Function? onpress}) {
  return MaterialButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    color: AppColors.blue,
    onPressed: () {
      onpress!();
    },
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}

Widget iconTitleContainer(
    {text,
    path,
    Function? onPress,
    bool isReadOnly = false,
    TextInputType type = TextInputType.text,
    TextEditingController? controller,
    Function? validator,
    double width = 150,
    double height = 40}) {
  return Container(
    // padding: EdgeInsets.only(left: 10),
    decoration: const BoxDecoration(
        // borderRadius: BorderRadius.circular(8),
        // border: Border.all(width: 0.1, color: AppColors.genderTextColor),
        ),
    width: width,
    height: height,
    child: TextFormField(
      validator: (String? input) => validator!(input!),
      controller: controller,
      keyboardType: type,
      readOnly: isReadOnly,
      onTap: () {
        onPress!();
      },
      decoration: InputDecoration(
        errorStyle: const TextStyle(fontSize: 0),
        contentPadding: const EdgeInsets.only(top: 3),
        prefixIcon: Image.asset(
          path,
          cacheHeight: 18,
        ),
        hintText: text,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.genderTextColor,
        ),
      ),
    ),
  );
}

Widget iconWithTitle({text, Function? func, bool? isShow = true}) {
  return Row(
    children: [
      !isShow!
          ? Container()
          : Expanded(
              flex: 0,
              child: InkWell(
                onTap: () {
                  func!();
                },
                child: Container(
                  margin: EdgeInsets.only(
                    left: Get.width * 0.02,
                    top: Get.height * 0.08,
                    bottom: Get.height * 0.02,
                  ),
                  // alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    // border: Border.all(width: 1),
                    // borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: AssetImage('assets/Header.png'),
                    ),
                  ),
                ),
              ),
            ),
      Expanded(
        flex: 6,
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: Get.height * 0.056,
            // left: Get.width * 0.26,
          ),
          child: myText(
            text: text,
            style: const TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      const Expanded(
        flex: 1,
        child: Text(''),
      )
    ],
  );
}

Widget labelTextField({label, hintText}) {
  return Container(
    margin: const EdgeInsets.only(top: 20),
    height: 48,
    child: TextFormField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          bottom: 44 / 2,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: label,
        hintText: hintText,
      ),
    ),
  );
}

Widget myText({text, style, textAlign}) {
  return Text(
    text,
    style: style,
    textAlign: textAlign,
    overflow: TextOverflow.ellipsis,
  );
}

Widget myTextField(
    {text,
    String? icon,
    bool,
    TextInputType,
    prefixIcon,
    TextEditingController? controller,
    Function? validator}) {
  return Center(
    child: SizedBox(
      height: 44,
      child: TextFormField(
        validator: (input) => validator!(input),
        controller: controller,
        obscureText: bool,
        keyboardType: TextInputType,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: AppColors.blue, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(width: 2, color: AppColors.red),
          ),
          contentPadding: const EdgeInsets.only(
            bottom: 44 / 2,
          ),
          errorStyle: const TextStyle(fontSize: 0, height: 44),
          hintStyle: TextStyle(
            color: AppColors.genderTextColor,
          ),
          hintText: text,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.blue),
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        textAlignVertical: TextAlignVertical.bottom,
      ),
    ),
  );
}

Widget rowContainer(Function onPressed, {text}) {
  return InkWell(
    onTap: () => onPressed(),
    child: Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 0.5, color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          myText(
              text: text,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
          )
        ],
      ),
    ),
  );
}

Widget settingIconAndText(
  Function onPressed, {
  text,
  image,
}) {
  return ListTile(
    onTap: () => onPressed(),
    leading: SvgPicture.asset(
      image,
      height: 20,
    ),
    title: Transform.translate(
      offset: const Offset(-16, 0),
      child: Text(text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          )),
    ),
  );
}

Widget socialAppsIcons({text, Function? onPressed}) {
  return InkWell(
    onTap: () => onPressed!(),
    child: Container(
      margin: const EdgeInsets.all(10),
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(text),
        ),
      ),
    ),
  );
}

Widget textField(
    {text,
    prefixIcon,
    TextEditingController? controller,
    Function? validator,
    TextInputType inputType = TextInputType.text}) {
  return SizedBox(
    height: 44,
    // margin: EdgeInsets.only(bottom: Get.height * 0.02),
    child: TextFormField(
      keyboardType: inputType,
      controller: controller,
      validator: (input) => validator!(input),
      decoration: InputDecoration(
          hintText: text,
          prefixIcon: prefixIcon,
          errorStyle: const TextStyle(fontSize: 0),
          contentPadding: const EdgeInsets.only(
            bottom: 44 / 2,
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
    ),
  );
}
