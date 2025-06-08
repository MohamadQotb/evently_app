import 'package:evently_app/UI/events/create_event/pick_event_location_screen.dart';
import 'package:evently_app/UI/events/create_event/providers/create_event_provider.dart';
import 'package:evently_app/UI/main_screen/models/category_slider_model.dart';
import 'package:evently_app/UI/main_screen/models/event_model.dart';
import 'package:evently_app/core/common/app_colors.dart';
import 'package:evently_app/core/common/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class EditEventScreen extends StatefulWidget {
  static const String routeName = '/editEvent';

  const EditEventScreen(
      {super.key, required this.event, required this.provider});
  final EventModel event;
  final CreateEventProvider provider;

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  int selectedIndex = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initEvent();
  }

  void initEvent() {
    widget.provider.city = widget.event.city;
    widget.provider.country = widget.event.country;

    widget.provider.selectedLocation = LatLng(
      widget.event.latitude ?? 0.0,
      widget.event.longitude ?? 0.0,
    );
    titleController.text = widget.event.title;
    descriptionController.text = widget.event.description;
    selectedDate = widget.event.date;
    selectedTime = TimeOfDay(
      hour: widget.event.date.hour,
      minute: widget.event.date.minute,
    );

    selectedIndex = CategorySliderModel.categories.sublist(1).indexWhere(
        (element) => element.category == widget.event.categoryValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Event',
          style: TextStyle(color: AppColors.mainColor),
        ),
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.mainColor,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    CategorySliderModel.categories
                        .sublist(1)[selectedIndex]
                        .category
                        .getImages(),
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 40,
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 10),
                    itemCount: CategorySliderModel.categories.sublist(1).length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ChoiceChip(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      labelPadding: EdgeInsets.zero,
                      label: Row(
                        children: [
                          Icon(
                            CategorySliderModel.categories
                                .sublist(1)[index]
                                .icon,
                            color: selectedIndex == index
                                ? Theme.of(context).scaffoldBackgroundColor
                                : AppColors.mainColor,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            CategorySliderModel.categories
                                .sublist(1)[index]
                                .title,
                          )
                        ],
                      ),
                      showCheckmark: false,
                      selected: selectedIndex == index,
                      onSelected: (value) {
                        selectedIndex = index;

                        setState(() {});
                      },
                      backgroundColor: selectedIndex == index
                          ? AppColors.mainColor
                          : Theme.of(context).scaffoldBackgroundColor,
                      labelStyle: TextStyle(
                        color: selectedIndex == index
                            ? Theme.of(context).scaffoldBackgroundColor
                            : AppColors.mainColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      selectedColor: AppColors.mainColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(46),
                          side: const BorderSide(
                            color: AppColors.mainColor,
                          )),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Title',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                  controller: titleController,
                  decoration: const InputDecoration(
                      hintText: 'Event Title',
                      prefixIcon: Icon(Icons.edit_square)),
                ),
                const SizedBox(height: 16),
                Text(
                  'Description',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (value) => value == null || value.isEmpty
                      ? 'Please enter a description'
                      : null,
                  controller: descriptionController,
                  maxLines: 4,
                  decoration: const InputDecoration(
                    hintText: 'Event Description',
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_month_outlined,
                      color: Theme.of(context).textTheme.titleMedium!.color,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text('Event Date',
                        style: Theme.of(context).textTheme.titleMedium),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          _selectDate();
                        },
                        child: Text(
                          selectedDate == null
                              ? 'Choose Date'
                              : DateFormat('yyy/MM/dd').format(selectedDate!),
                          style: const TextStyle(
                              decoration: TextDecoration.none,
                              fontStyle: FontStyle.normal),
                        ))
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: Theme.of(context).textTheme.titleMedium!.color,
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    Text('Event Time',
                        style: Theme.of(context).textTheme.titleMedium),
                    const Spacer(),
                    TextButton(
                        onPressed: () {
                          _selectTime();
                        },
                        child: Text(
                          selectedTime == null
                              ? 'Choose Time'
                              : DateFormat('hh:mm a').format(DateTime(0, 0, 0,
                                  selectedTime!.hour, selectedTime!.minute)),
                          style: const TextStyle(
                              decoration: TextDecoration.none,
                              fontStyle: FontStyle.normal),
                        ))
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Location',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.all(8)),
                    onPressed: () {
                      Navigator.pushNamed(
                          context, PickEventLocationScreen.routeName,
                          arguments: widget.provider);
                    },
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(Icons.my_location_sharp,
                              size: 22,
                              color: Theme.of(context).scaffoldBackgroundColor),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            '${widget.provider.city}, ${widget.provider.country}',
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                        const Spacer(),
                        const Icon(Icons.arrow_forward_ios)
                      ],
                    )),
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate() &&
                          selectedDate != null &&
                          selectedTime != null &&
                          widget.provider.selectedLocation != null) {
                        updateEvent();

                        FirebaseServices.updateEvent(widget.event);
                        widget.provider.clearSelectedLocation();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Event Updated Successfully!')),
                        );
                        Navigator.pop(context);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text(
                                  'Please fill all fields and select date/time/location.')),
                        );
                      }
                    },
                    child: const Text('Update Event'))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void updateEvent() {
    widget.event.title = titleController.text;
    widget.event.description = descriptionController.text;
    widget.event.date = DateTime(
      selectedDate!.year,
      selectedDate!.month,
      selectedDate!.day,
      selectedTime!.hour,
      selectedTime!.minute,
    );
    widget.event.categoryValue =
        CategorySliderModel.categories.sublist(1)[selectedIndex].category;
    widget.event.city = widget.provider.city;
    widget.event.country = widget.provider.country;
    widget.event.latitude = widget.provider.selectedLocation!.latitude;
    widget.event.longitude = widget.provider.selectedLocation!.longitude;
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime ?? TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        selectedTime = pickedTime;
        selectedDate = selectedDate!.copyWith(
          hour: pickedTime.hour,
          minute: pickedTime.minute,
        );
      });
    }
  }
}
