/*
 * This file is part of the Meegopas, more information at www.gitorious.org/meegopas
 *
 * Author: Jukka Nousiainen <nousiaisenjukka@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * See full license at http://www.gnu.org/licenses/gpl-3.0.html
 */

import QtQuick 2.1
import Sailfish.Silica 1.0
import "reittiopas.js" as Reittiopas
import "UIConstants.js" as UIConstants

Page {
//  TODO:
    backNavigation: false
    showNavigationIndicator: false

    anchors.fill: parent
    Button {
        id: backButton
        text: qsTr("<< Back")
        anchors.top: parent.top
        onClicked: pageStack.pop()
    }

    onStatusChanged: {
        if(status == Component.Ready)
            timer.start()
    }

    Timer {
        id: timer
        interval: 500
        triggeredOnStart: false
        repeat: false
        onTriggered: map_loader.sourceComponent = map_component
    }
/*
// TODO:
    ToolBarLayout {
        id: mapTools
        ToolIcon { iconId: "toolbar-back"
            onClicked: {
                pageStack.pop();
            }
        }
        ToolButtonRow {
            ToolIcon { iconId: "toolbar-mediacontrol-previous"; enabled: !appWindow.followMode; onClicked: { map_loader.item.previous_station(); } }
            ToolIcon { iconId: "toolbar-mediacontrol-next"; enabled: !appWindow.followMode; onClicked: { map_loader.item.next_station(); } }
        }
        ToolIcon { platformIconId: "toolbar-view-menu";
             anchors.right: parent===undefined ? undefined : parent.right
             onClicked: (menu.status == DialogStatus.Closed) ? menu.open() : menu.close()
        }
    }
*/
    Loader {
        id: map_loader
        anchors.fill: parent
        onLoaded: {
            map_loader.item.initialize()
            map_loader.item.first_station()
        }
    }

    Component {
        id: map_component
        MapElement {
            anchors.fill: parent
            anchors.topMargin: backButton.height
        }
    }

    BusyIndicator {
        id: busyIndicator
        visible: !map_loader.sourceComponent || map_loader.status == Loader.Loading
        running: true
        size: BusyIndicatorSize.Large
        anchors.centerIn: parent
    }
}

