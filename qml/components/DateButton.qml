/**********************************************************************
*
* This file is part of the JollaOpas, forked from Jopas originally
* forked from Meegopas.
* More information:
*
*   https://github.com/hsarkanen/JollaOpas
*   https://github.com/rasjani/Jopas
*   https://github.com/junousia/Meegopas
*
* Author: Heikki Sarkanen <heikki.sarkanen@gmail.com>
* Original author: Jukka Nousiainen <nousiaisenjukka@gmail.com>
* Other contributors:
*   Jani Mikkonen <jani.mikkonen@gmail.com>
*   Jonni Rainisto <jonni.rainisto@gmail.com>
*   Mohammed Sameer <msameer@foolab.org>
*   Clovis Scotti <scotti@ieee.org>
*   Benoit HERVIER <khertan@khertan.net>
*
* All assets contained within this project are copyrighted by their
* respectful authors.
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* See full license at http://www.gnu.org/licenses/gpl-3.0.html
*
**********************************************************************/

import QtQuick 2.1
import Sailfish.Silica 1.0

BackgroundItem {
    id: dateContainer
    width: dateButton.width
    height: dateButton.height
    property date storedDate
    signal dateChanged(variant newDate)

    onClicked: {
        var dialog = pageStack.push("Sailfish.Silica.DatePickerDialog", {date: storedDate})
        dialog.accepted.connect(function() {
            dateContainer.storedDate = dialog.date
            dateContainer.dateChanged(dateContainer.storedDate)
        })
    }

    function updateDate() {
        storedDate = new Date()
        dateChanged(storedDate)
    }

    Label {
        id: dateButton
        font.pixelSize: Theme.fontSizeLarge
        anchors.right: parent.right
        color: Theme.secondaryColor
        text: Qt.formatDate(storedDate, "ddd, dd.MM.")
    }
}


