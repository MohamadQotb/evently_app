import 'package:evently_app/UI/main_screen/models/event_model.dart';
import 'package:evently_app/core/common/app_colors.dart';
import 'package:flutter/material.dart';

class EventMapCard extends StatelessWidget {
  const EventMapCard({super.key, required this.eventModel});
  final EventModel eventModel;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(8),
      key: UniqueKey(),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: Theme.of(context).scaffoldBackgroundColor,
        border: Border.all(
          color: AppColors.mainColor,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: SizedBox(
              width: size.width * 0.35,
              height: size.height * 0.1,
              child: Image.asset(
                eventModel.categoryValue.getImages(),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  width: 150,
                  child: Text(
                    eventModel.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: AppColors.mainColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: Theme.of(context).textTheme.titleMedium!.color,
                  ),
                  const SizedBox(width: 4),
                  Text(
                      '${eventModel.city ?? 'Unknown'}, ${eventModel.country ?? 'Unknown'}',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(fontSize: 14)),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
