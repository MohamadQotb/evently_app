import 'package:evently_app/UI/main_screen/models/event_model.dart';
import 'package:evently_app/core/common/app_colors.dart';
import 'package:evently_app/core/common/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventCardWidget extends StatelessWidget {
  const EventCardWidget({super.key, required this.eventModel});

  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      key: UniqueKey(),
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                eventModel.categoryValue.getImages(),
              ),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Text(
              textAlign: TextAlign.center,
              DateFormat('dd\nMMM').format(eventModel.date),
              style: const TextStyle(
                  height: 0,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.mainColor),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  eventModel.title,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                FavButton(eventModel: eventModel),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FavButton extends StatefulWidget {
  const FavButton({
    super.key,
    required this.eventModel,
  });

  final EventModel eventModel;

  @override
  State<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends State<FavButton> {
  late bool isFav = widget.eventModel.isFavorite;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isFav = !isFav;
        });
        FirebaseServices.changeEventFav(widget.eventModel, isFav);
      },
      child: Icon(
        isFav ? Icons.favorite : Icons.favorite_border,
        color: AppColors.mainColor,
        size: 24,
      ),
    );
  }
}
