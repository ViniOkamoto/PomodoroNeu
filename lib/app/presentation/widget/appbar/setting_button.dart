import 'package:flutter/material.dart';
import 'package:pomodoroapp/app/presentation/widget/concave_decoration.dart';
import 'package:pomodoroapp/app/presentation/widget/dropdown/drop_down.dart';
import 'package:pomodoroapp/core/values/colors.dart';
import 'package:pomodoroapp/core/values/styles.dart';

class SettingButton extends StatefulWidget {
  final isDark;

  SettingButton(this.isDark);

  @override
  _SettingButtonState createState() => _SettingButtonState();
}

class _SettingButtonState extends State<SettingButton>
    with SingleTickerProviderStateMixin {
  //Configs to dropdown container
  //this key will catch renderbox options of the father component.
  GlobalKey actionKey;
  double height, width, xPosition, yPosition;
  OverlayEntry floatingDropDown;

  // ends
  bool _isPressed = false;

  @override
  void initState() {
    actionKey = LabeledGlobalKey("Settings");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: actionKey,
      onTap: () {
        setState(() {
          if (_isPressed) {
            floatingDropDown.remove();
          } else {
            findDropdownData();
            floatingDropDown = _createFloatingDropdown();
            Overlay.of(context).insert(floatingDropDown);
          }
          _isPressed = !_isPressed;
        }
        );
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: _isPressed
            ? innerShadow(
          bottomColor: this.widget.isDark ? whiteShadow30Dark : whiteShadow100Light,
          topColor: this.widget.isDark ? blackShadow30Dark : blackShadow10Light
        )
            : tertiaryDropShadow(
                shape: BoxShape.circle,
                colorWidget: this.widget.isDark ? blackColor : whiteColor,
                bottomColor:
                    this.widget.isDark ? blackShadow30Dark : blackShadow10Light,
                topColor:
                    this.widget.isDark ? whiteShadow30Dark : whiteShadow100Light,
              ),
        child: Icon(
          Icons.settings,
          size: 30,
          color: orangeColor,
        ),
      ),
    );
  }

  OverlayEntry _createFloatingDropdown() {
    return OverlayEntry(builder: (context) {
      return Positioned(
          left: xPosition - width,
          top: yPosition + height,
          width: 80,
          //2 is the quantities of elements in my dropdown list
          height: 2 * height + 40,
          child: DropDown(
            itemHeight: height,
          ));
    });
  }

  void findDropdownData() {
    //Here i find my object and catching renders info about it.
    RenderBox renderBox = actionKey.currentContext.findRenderObject();
    height = renderBox.size.height;
    width = renderBox.size.width;
    //Here I take the exact point where the widget is.
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
  }
}
