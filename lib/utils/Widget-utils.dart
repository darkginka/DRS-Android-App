import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dropdown_search/dropdown_search.dart';

class WidgetUtils {
  static Widget textFormField(String? labelText, String hintText,
      String? Function(String?)? validator, TextEditingController? controller,
      {bool isReadOnly = false,
      TextInputType textInputType = TextInputType.text,
      bool obscure = false,
      int maxLine = 1,
      bool isMaxLine = false,
      Widget? icon,
      Widget? suffixIcon,
      Widget? prefixIcon,
      Key? key,
      int? maxLength,
      bool isLoginForm = false,
      TextInputAction textInputAction = TextInputAction.next}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
      child: TextFormField(
        maxLength: maxLength,
        textInputAction: maxLine > 1 ? null : textInputAction,
        style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w400,
            fontSize: 15,
            letterSpacing: 1),
        key: key,
        autofocus: false,
        keyboardType: textInputType,
        controller: controller,
        validator: validator,
        obscureText: obscure,
        maxLines: maxLine,
        decoration: InputDecoration(
          filled: isLoginForm ? true : null,
          fillColor:
              isLoginForm ? const Color.fromARGB(50, 203, 219, 245) : null,
          enabledBorder: isLoginForm
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.0),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          icon: icon,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          labelText: labelText,
          contentPadding:
              isMaxLine ? null : const EdgeInsets.fromLTRB(10, 0, 10, 0),
        ),
      ),
    );
  }

  static Widget searchAbleDropDown(
      List<dynamic> _dropdownItems,
      String? holder,
      String labelText,
      String? SelectedItem,
      Widget? icon,
      ValueChanged? onChange,
      String? DropdownPopUpText,
      Color? color,
      String? searchFieldPropsLabelText,
      FormFieldValidator? validator,
      {bool showSearchBox = true,
      FocusNode? focusNode,
      bool showClearButton = true,
      bool autoFocus = true,
      Key? key}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
      child: Container(
        width: 350,
        child: DropdownSearch(
          key: key,
          focusNode: focusNode,
          showClearButton: showClearButton,
          mode: Mode.BOTTOM_SHEET,
          items: _dropdownItems,
          dropdownSearchDecoration: InputDecoration(
            icon: icon,
            labelText: labelText,
            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
              borderSide: BorderSide(color: Colors.red, width: 2.0),
            ),
          ),
          validator: validator,
          onChanged: onChange,
          selectedItem: SelectedItem,
          showSearchBox: showSearchBox,
          searchFieldProps: TextFieldProps(
            autofocus: autoFocus,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32.0),
                borderSide: BorderSide(color: Colors.red, width: 2.0),
              ),
              contentPadding: EdgeInsets.fromLTRB(12, 12, 8, 0),
              labelText: searchFieldPropsLabelText,
            ),
          ),
          popupTitle: Container(
            height: 50,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Center(
              child: Text(
                '$DropdownPopUpText',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          popupShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
        ),
      ),
    );
  }

  static Widget dropDownButton(
      String? hint,
      String? label,
      String _dropDownValue,
      List<dynamic> dropDownItem,
      Function(dynamic)? onChange,
      {String? Function(String?)? validator,
      String? holder,
      Widget? widget}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
      child: Row(
        children: [
          widget ?? const Text(""),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: DropdownButtonFormField2(
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    label: Text("$label")),
                value: holder,
                focusColor: Colors.transparent,
                isExpanded: true,
                hint: Text(
                  '$hint',
                  style: const TextStyle(fontSize: 14),
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 30,
                buttonHeight: 60,
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                items: dropDownItem
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ))
                    .toList(),
                validator: validator,
                onChanged: onChange,
                dropdownPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void showToast(String message, BuildContext context) {
    Fluttertoast.showToast(
      msg: message,
      webPosition: "center",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
    );
  }

  static void cancelToast() {
    Fluttertoast.cancel();
  }

  static Widget buildRoundBtn(String? btnsend, Function()? onPressed) {
    return SizedBox(
      height: 50,
      width: 180,
      child: ElevatedButton(
          child: Text("$btnsend"),
          style: ElevatedButton.styleFrom(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: const BorderSide(color: Colors.blue),
            ),
            primary: Colors.blue,
          ),
          onPressed: onPressed),
    );
  }

  static confirmDialog(
    String? title,
    Function()? onPressed,
    BuildContext context,
  ) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("$title"),
          actions: [
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.red,
                    elevation: 5,
                  ),
                  child: const Text("ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )),
          ],
        );
      },
    );
  }

  static Widget buildTable(
    List<String> headers,
    List<DataRow> rows,
  ) {
    return DataTable(
      showCheckboxColumn: false,
      showBottomBorder: true,
      horizontalMargin: 5,
      dividerThickness: 2,
      columnSpacing: 25,
      headingRowColor: MaterialStateColor.resolveWith((states) => Colors.teal),
      columns: _buildTableHeader(headers),
      rows: rows,
    );
  }

  static List<DataColumn> _buildTableHeader(List<String> headers) {
    List<DataColumn> tableHeader;
    tableHeader = headers
        .map((header) => DataColumn(
            label: Text(header,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.white)),
            numeric: false))
        .toList();
    return tableHeader;
  }

  static Card expandedCard(String question, String ans) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
            top: 10.0, left: 6.0, right: 10.0, bottom: 6.0),
        child: ExpansionTile(
          expandedAlignment: Alignment.topLeft,
          initiallyExpanded: false,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          title: Text(
            question,
            maxLines: 2,
            style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 14),
          ),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 7, 10, 7),
              child: Text(
                ans,
                maxLines: 50,
                style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 13),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  static circularDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  static showPopUp(
    String? title,
    BuildContext context,
    Function()? onPressed,
    Widget? column, {
    Function()? cancelButton,
    bool isUpdating = false,
  }) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("$title"),
            content: column,
            actions: [
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                    elevation: 5,
                  ),
                  child: const Text("OK"),
                  onPressed: onPressed,
                ),
              ),
            ],
          );
        });
  }

  static AppBar buildAppBar(BuildContext context, String? name,
      {IconData? icon,
      Function()? onPressed,
      bool isDrawer = false,
      List<Widget>? action}) {
    final title = Text(
      name!,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
          fontSize: 17,
          color: Color.fromARGB(255, 255, 149, 11),
          fontWeight: FontWeight.bold),
    );
    return AppBar(
      leading: icon == null
          ? null
          : IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.blue,
              ),
            ),
      iconTheme: const IconThemeData(color: Colors.blue),
      title: title,
      actions: action,
      centerTitle: true,
      backgroundColor: const Color.fromARGB(255, 222, 240, 253),
      elevation: 0,
    );
  }
}
