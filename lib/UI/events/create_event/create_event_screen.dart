import 'package:evently_app/UI/events/create_event/pick_event_location_screen.dart';
import 'package:evently_app/UI/events/create_event/providers/create_event_provider.dart';
import 'package:evently_app/UI/main_screen/models/category_slider_model.dart';
import 'package:evently_app/UI/main_screen/models/event_model.dart';
import 'package:evently_app/core/common/app_colors.dart';
import 'package:evently_app/core/common/services/firebase_services.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CreateEventScreen extends StatefulWidget {
  static const String routeName = '/createEvent';
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  int selectedIndex = 0;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    CreateEventProvider provider = Provider.of<CreateEventProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Event',
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
                    CategorySliderModel.categories[selectedIndex + 1].category
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
                    itemCount: CategorySliderModel.categories.length - 1,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => ChoiceChip(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      labelPadding: EdgeInsets.zero,
                      label: Row(
                        children: [
                          Icon(
                            CategorySliderModel.categories[index + 1].icon,
                            color: selectedIndex == index
                                ? Theme.of(context).scaffoldBackgroundColor
                                : AppColors.mainColor,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            CategorySliderModel.categories[index + 1].title,
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
                              : '${selectedTime!.hourOfPeriod}:${selectedTime!.minute} ${selectedTime!.period.name}',
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
                          arguments: provider);
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
                        provider.selectedLocation == null
                            ? const Text('Choose Event Location')
                            : Text(
                                '${provider.city}, ${provider.country}',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
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
                          provider.selectedLocation != null) {
                        FirebaseServices.addEvent(EventModel(
                            city: provider.city,
                            country: provider.country,
                            longitude:
                                provider.selectedLocation?.longitude ?? 0,
                            latitude: provider.selectedLocation?.latitude ?? 0,
                            categoryValue:
                                CategoryValues.values[selectedIndex + 1],
                            title: titleController.text,
                            description: descriptionController.text,
                            date: selectedDate!));
                        provider.clearSelectedLocation();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Event Created Successfully!')),
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
                    child: const Text('Add Event'))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
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
