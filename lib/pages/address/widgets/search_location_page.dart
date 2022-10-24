import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxnow_beta/controller/location_controller.dart';
import 'package:taxnow_beta/utils/dimension.dart';
import 'package:google_maps_webservice/places.dart';

class SearchLocationPage extends StatelessWidget {
  final GoogleMapController mapController;
  const SearchLocationPage({super.key, required this.mapController});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    return Container(
      padding: EdgeInsets.all(Dimensions.width10),
      alignment: Alignment.topCenter,
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.radius20 / 3),
        ),
        child: SizedBox(
            width: Dimensions.screenWidth,
            child: TypeAheadField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: _controller,
                textInputAction: TextInputAction.search,
                autofocus: true,
                textCapitalization: TextCapitalization.words,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  hintText: "Search Location",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      style: BorderStyle.none,
                      width: 0,
                    ),
                  ),
                ),
              ),
              onSuggestionSelected: (suggestion) {},
              suggestionsCallback: (String pattern) async {
                return await Get.find<LocationController>()
                    .searchLocation(context, pattern);
              },
              itemBuilder: (context, Prediction suggestion) {
                return Row(
                  children: [
                    Icon(Icons.location_on),
                    Expanded(
                      child: Text(
                        suggestion.description!,
                      ),
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}
