import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/services/button_message_bus.dart';

import '../service_locator.dart';

class ConnectedButton extends StatefulWidget {
  final int id;

  ConnectedButton({@required this.id});

  @override
  _ConnectedButtonState createState() => _ConnectedButtonState();
}

class _ConnectedButtonState extends State<ConnectedButton> {
  bool _active = false;
  double _size = 100;

  ButtonMessageBus _messageBus = locator<ButtonMessageBus>();
  StreamSubscription<int> messageSubscription;

  Widget get _buttonUi => AnimatedContainer(
        curve: Curves.bounceIn,
        width: _size,
        height: _size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey[500],
          borderRadius: BorderRadius.circular(10.0),
        ),
        duration: Duration(milliseconds: 150),
        child: Text(
          'id: ${widget.id} -> ${_active.toString()}',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  @override
  void initState() {
    messageSubscription = _messageBus.idStream.listen(_idReceived);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _messageBus.broadcastId(widget.id);
      },
      child: _buttonUi,
    );
  }

  @override
  void dispose() {
    messageSubscription.cancel();
    super.dispose();
  }

  void _idReceived(int id) {
    setState(() {
      if (id == widget.id) {
        _active = true;
        _size = 140;
      } else {
        _active = false;
        _size = 100;
      }
    });
  }
}
